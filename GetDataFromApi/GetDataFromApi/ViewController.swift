//
//  ViewController.swift
//  GetDataFromApi
//
//  Created by Ashish Pisey on 14/10/21.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    var photoObj : Photo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getData()
    }
    
    func getData() {
        //"http://jsonplaceholder.typicode.com/photos")
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
                        // try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                        
                        // old way
                        if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [[String:Any]] {
                            self.parseData(photoArray: jsonResult)
                        }
                        
                        // new way
                        //let photoArray = try JSONDecoder().decode([Photo].self, from:data!)
                        //self.parsePhotos(photos: photoArray)
                        let userArray = try JSONDecoder().decode([User].self, from:data!)
                        let user = userArray[0]
                        print(user.address.geo.lat)
                        
                    } catch {
                        print(error)
                    }
                })
                // execute the task and then wait for the response
                // to run the completion handler. This is async!
                print("after do block") // 2
                task.resume()
    }

    func parseData(photoArray:[[String:Any]]) {
        let photoDict = photoArray[0]
        if let thumbnailURL = photoDict["thumbnailUrl"] as? String,
           let albumID = photoDict["albumId"] as? Int,
           let url = URL(string: thumbnailURL) {
            print(thumbnailURL)
            print(albumID)
            // create an array
            //low priority

            //Always update ui on main thread
            DispatchQueue.main.async {
                // higher priority stuff
                self.myImageView.kf.setImage(with:url)
                // reload table view
            }
        }
    }
    
    func parsePhotos(photos:[Photo]) {
        let photoObj = photos[0]
        print(photoObj.thumbnailUrl)
        let url = URL(string: photoObj.thumbnailUrl)
        DispatchQueue.main.async {
            // higher priority stuff
            self.myImageView.kf.setImage(with:url)
            // reload table view
        }
    }
    
    func parseUser(users: [User]) {
        let user = users[0]
        print(user.address.geo.lat)
    }

}


// task 1:- Call an api
// task 2:- wait for response from api
// task 3:- After response received :- Load the UI/ Refresh the UI

