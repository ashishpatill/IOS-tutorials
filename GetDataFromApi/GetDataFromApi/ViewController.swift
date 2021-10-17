//
//  ViewController.swift
//  GetDataFromApi
//
//  Created by Ashish Pisey on 14/10/21.
//

import UIKit
import Kingfisher
import Alamofire

class ViewController: UIViewController {

    var recipeArr : [Recipe]? = []
    @IBOutlet weak var recipeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        recipeTableView.dataSource  = self
        getRecipeData()
        //getUserData()
        //getRecipeDataWithAF()
    }
    
    func getRecipeDataWithAF() {
        AF.request("http://jsonplaceholder.typicode.com/photos").responseDecodable(of: [Recipe].self) { response in
            //print(response.value)
            self.recipeArr = response.value
            DispatchQueue.main.async {
                self.recipeTableView.reloadData()
            }
        }
    }
    
    func getRecipeData() {
       
        print("before do block") // 1
        let url = URL(string: "http://jsonplaceholder.typicode.com/photos")
        // create a URLSession to handle the request tasks
        let session = URLSession.shared
        // create a "data task" to make the request and run completion handler
        let task = session.dataTask(with: url!, completionHandler: {
            // see: Swift closure expression syntax
            data, response, error in
            
            do {
                print("inside do block") // 3
                self.recipeArr = try JSONDecoder().decode([Recipe].self, from:data!)
                DispatchQueue.main.async {
                    self.recipeTableView.reloadData()
                }
                
            } catch {
                print(error)
            }
        })
        // execute the task and then wait for the response
        // to run the completion handler. This is async!
        print("after do block") // 2
        task.resume()
        
    }
    
    func getUserData() {
        print("before do block") // 1
        let url = URL(string: "http://jsonplaceholder.typicode.com/users")
        // create a URLSession to handle the request tasks
        let session = URLSession.shared
        // create a "data task" to make the request and run completion handler
        let task = session.dataTask(with: url!, completionHandler: {
            // see: Swift closure expression syntax
            data, response, error in
            
            do {
                print("inside do block") // 3
                let userArr = try JSONDecoder().decode([User].self, from:data!)
                DispatchQueue.main.async {
                    print(userArr[0].address.geo.lat)
                }
                
            } catch {
                print(error)
            }
        })
        // execute the task and then wait for the response
        // to run the completion handler. This is async!
        print("after do block") // 2
        task.resume()
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeArr?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath) as! RecipeCell
        
        if let recipeObj = recipeArr?[indexPath.row] {
            
            let recipeName = recipeObj.title
            let recipeURL = URL(string:recipeObj.thumbnailUrl)
            
            cell.receipeName.text = recipeName
            cell.receipeImage.kf.setImage(with:recipeURL)
        }
        return cell
    }
}


// task 1:- Call an api
// task 2:- wait for response from api
// task 3:- After response received :- Load UI/ Refresh UI

