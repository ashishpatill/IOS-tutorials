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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getData()
    }
    
    func getData() {
        let url = URL(string: "http://jsonplaceholder.typicode.com/photos")
                // create a URLSession to handle the request tasks
                let session = URLSession.shared
                // create a "data task" to make the request and run completion handler
                let task = session.dataTask(with: url!, completionHandler: {
                    // see: Swift closure expression syntax
                    data, response, error in
                    
                    
                    do {
                        // try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                        if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [[String:Any]] {
                            self.parseData(array: jsonResult)
                        }
                    } catch {
                        print(error)
                    }
                })
                // execute the task and then wait for the response
                // to run the completion handler. This is async!
                task.resume()
    }
    
    func parseData(array:[[String:Any]]) {
        let photoDict = array[0]
        if let thumbnailURL = photoDict["thumbnailUrl"] as? String ,
           let url = URL(string: thumbnailURL) {
            print(thumbnailURL)
            // create an array
            //Always update ui on main thread
            DispatchQueue.main.async {
                self.myImageView.kf.setImage(with:url)
                // reload table view
            }
            
        }
    }


}

