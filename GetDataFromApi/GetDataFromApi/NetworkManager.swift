//
//  NetworkManager.swift
//  GetDataFromApi
//
//  Created by Ashish Pisey on 18/10/21.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static func getMovies(successHandler: @escaping (Task?) -> Void,
                          errorHandler: @escaping (Error?) -> Void) {
        
        print("Inside network manager before calling an api")
        
        let parameters = ["objective":"Go to the mall"]
        AF.request("https://saudibucketlistapi.herokuapp.com/tasks/1/", method: .put, parameters: parameters).responseDecodable(of: Task.self) { response in
            
            if let moviesResponse = response.value {
                print("Inside network manager success handler")
                successHandler(moviesResponse)
            } else {
                errorHandler(response.error)
            }
        }
    }
    
    static func getMoviesArr(successHandler:@escaping (_ movieTitles: [String]) -> Void,
                      errorHandler:@escaping (_ error: Error?) -> Void) {
        // Specify the url that we will be sending the GET Request to
        let url = URL(string: "https://swapi.dev/api/films/?format=json")
        // Create a URLSession to handle the request tasks
        let session = URLSession.shared
        // Create a "data task" which will request some data from a URL and then run the completion handler that we are passing into the getAllPeople function itself
        let task = session.dataTask(with: url!, completionHandler: {
            // see: Swift closure expression syntax
            data, response, error in
            
            if let error = error {
                print(error)
                errorHandler(error)
            } else {
                print("inside do block") // 3
                
                var movieArr:[String] = []
                do {
                    if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                        if let resultsArr = jsonResult["results"] as? [[String:Any]] {
                            for movieObj in resultsArr {
                                if let movieName = movieObj["title"] as? String {
                                    movieArr.append(movieName)
                                }
                            }
                        }
                    }
                } catch {
                    print(error)
                }
                successHandler(movieArr)
            }
        })
        // Actually "execute" the task. This is the line that actually makes the request that we set up above
        task.resume()
    }
}

struct Task:Codable {
    let created_at : String
    let id: Int
    let objective : String
}
