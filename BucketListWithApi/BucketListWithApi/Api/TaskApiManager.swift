//
//  TaskApiManager.swift
//  BucketListWithApi
//
//  Created by Ashish Pisey on 25/10/21.
//

import Foundation
import Alamofire

class TaskApiManager {
    
    static func getAllTasks(completionHandler: @escaping (_ taskList: [TaskModel]?, _ error:Error?) -> Void) {
        AF.request("https://saudibucketlistapi.herokuapp.com/tasks/").responseDecodable(of: [TaskModel].self) { response in
            guard let taskResponse = response.value else {
                //failure
                completionHandler(nil, response.error)
                return
            }
            
            // success
            completionHandler(taskResponse, nil)
        }
    }
    
    static func addTask(objective:String, completionHandler: @escaping (_ task: TaskModel?, _ error: Error? ) -> Void) {
        let parameter = ["objective": objective]
        AF.request("https://saudibucketlistapi.herokuapp.com/tasks/", method: .post, parameters: parameter).responseDecodable(of: TaskModel.self) { response in
            guard let taskResponse = response.value else {
                //failure
                completionHandler(nil, response.error)
                return
            }
            
            // success
            completionHandler(taskResponse, nil)
        }
    }
    
    static func updateTask(id:Int, objective:String, completionHandler: @escaping (_ task: TaskModel?, _ error: Error? ) -> Void) {
        let parameter = ["objective": objective]
        AF.request("https://saudibucketlistapi.herokuapp.com/tasks/\(id)/", method: .put, parameters: parameter).responseDecodable(of: TaskModel.self) { response in
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
