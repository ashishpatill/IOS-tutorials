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

    var recipeArr : [Recipe] = []
    var movieArr : [String] = []
    
    var taskArr : [TaskObject] = []
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var recipeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.activityIndicator.hidesWhenStopped = true
        
        recipeTableView.dataSource  = self
        recipeTableView.delegate = self
        //getRecipeData()
        //getUserData()
        //getMoviesWithAFAndVapor()
        //getMovies()
        getRecipeDataWithAF()
        
        //getTasks()
    }
    
    func addTasks() {
        TaskModel.addTask(objective: "Go to the garden 3", completionHandler: { task, error in
                guard let task = task else {
                    print("Error: \(error?.localizedDescription ?? "")")
                    return
                }
                print(task.objective)
                print(task.id)
                self.getTasks()
        })
    }
    
    func getTasks() {
        TaskModel.getAllTasks { taskList, error in
            guard let taskArr = taskList else {
                print("Error: \(error?.localizedDescription ?? "")")
                return
            }
            self.taskArr = taskArr
            
            DispatchQueue.main.async {
                self.recipeTableView.reloadData()
            }
        }
    }
    
    func updateTask(id: Int, objective:String) {
        TaskModel.updateTask(id:id, objective: objective, completionHandler: { task, error in
                guard let task = task else {
                    print("Error: \(error?.localizedDescription ?? "")")
                    return
                }
                print(task.objective)
                print(task.id)
                self.getTasks()
        })
    }
    
//    func getMoviesWithAFAndVapor() {
//        self.activityIndicator.startAnimating()
//        print ("Inside View controller before calling an api")
//        NetworkManager.getMovies { movieResponse in
//            if let response = movieResponse {
//                print ("Inside View controller success handler")
//                self.movieArr = response.movies
//
//                DispatchQueue.main.async {
//                    self.activityIndicator.stopAnimating()
//                    self.recipeTableView.reloadData()
//                }
//            }
//        } errorHandler: { error in
//            DispatchQueue.main.async {
//                self.activityIndicator.stopAnimating()
//            }
//            print(error?.localizedDescription ?? "")
//        }
//    }
    
    func getMovies() {
        self.activityIndicator.startAnimating()
        NetworkManager.getMovies (successHandler: { task in
            //self.movieArr = movieTitleArr
            print(task?.objective)
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.recipeTableView.reloadData()
            }
        }, errorHandler: { error in
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
            }
            print(error?.localizedDescription)
        })
    }

    func getRecipeDataWithAF() {
        activityIndicator.startAnimating()
        AF.request("http://jsonplaceholder.typicode.com/photos").responseDecodable(of: [Recipe].self) { response in
            //print(response.value)
            guard let recipeArr = response.value else { return }
            self.recipeArr = recipeArr
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.recipeTableView.reloadData()
            }
        }
    }
    
    func getRecipeData() {
       
        print("before do block") // 1
        let url = URL(string: "https://api.tvmaze.com/shows")
        // create a URLSession to handle the request tasks
        let session = URLSession.shared
        // create a "data task" to make the request and run completion handler
        let task = session.dataTask(with: url!, completionHandler: {
            // see: Swift closure expression syntax
            data, response, error in
            
            do {
                
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [[String:Any]] {
                    if let movieObject = jsonResult[0] as? [String:Any] {
                        let name = movieObject["name"] as! String
                        print("name of movie: \(name)")
                    }
                }
                print("inside do block") // 3
                
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

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if recipeArr.count > 0 {
            return recipeArr.count
        } else if movieArr.count > 0 {
            return movieArr.count
        } else {
            return taskArr.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath) as! RecipeCell
        
        if recipeArr.count > 0 {
            let recipeObj = recipeArr[indexPath.row]
            let recipeName = recipeObj.title
            let recipeURL = URL(string:recipeObj.thumbnailUrl)

            cell.receipeName.text = recipeName
            
            // fetch image with kingfisher
            cell.receipeImage.kf.setImage(with:recipeURL)
            
            
        } else if movieArr.count > 0 {
            cell.receipeName.text = movieArr[indexPath.row]
        } else {
            cell.receipeName.text = taskArr[indexPath.row].objective
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard taskArr != nil else { return }
        let selectedObject = taskArr[indexPath.row]
        let id = selectedObject.id
        let objective = selectedObject.objective + " updated"
        print("id: \(id), new Objective: \(objective)")
        updateTask(id: id, objective: objective)
    }
}


// task 1:- Call an api
// task 2:- wait for response from api
// task 3:- After response received :- Load UI/ Refresh UI

struct MoviesRequest : Codable {
    let genre : String
}
