//
//  TaskModel.swift
//  GetDataFromApi
//
//  Created by Ashish Pisey on 24/10/21.
//

import Foundation
import Alamofire

class TaskModel {
    static func getAllTasks(completionHandler: @escaping (_ taskList: [TaskObject]?, _ error:Error?) -> Void) {
        AF.request("https://saudibucketlistapi.herokuapp.com/tasks/").responseDecodable(of: [TaskObject].self) { response in
            guard let taskResponse = response.value else {
                //failure
                completionHandler(nil, response.error)
                return
            }
            
            // success
            completionHandler(taskResponse, nil)
        }
    }
    
    static func addTask(objective:String, completionHandler: @escaping (_ task: TaskObject?, _ error: Error? ) -> Void) {
        let parameter = ["objective": objective]
        AF.request("https://saudibucketlistapi.herokuapp.com/tasks/", method: .post, parameters: parameter).responseDecodable(of: TaskObject.self) { response in
            guard let taskResponse = response.value else {
                //failure
                completionHandler(nil, response.error)
                return
            }
            
            // success
            completionHandler(taskResponse, nil)
        }
    }
    
    static func updateTask(id:Int, objective:String, completionHandler: @escaping (_ task: TaskObject?, _ error: Error? ) -> Void) {
        let parameter = ["objective": objective]
        AF.request("https://saudibucketlistapi.herokuapp.com/tasks/\(id)/", method: .put, parameters: parameter).responseDecodable(of: TaskObject.self) { response in
            guard let taskResponse = response.value else {
                //failure
                completionHandler(nil, response.error)
                return
            }
            
            // success
            completionHandler(taskResponse, nil)
        }
    }
    
    
}





