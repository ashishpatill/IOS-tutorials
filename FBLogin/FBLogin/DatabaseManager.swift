//
//  DatabaseManager.swift
//  FBLogin
//
//  Created by Ashish Pisey on 09/11/21.
//

import Foundation
import Firebase

class DatabaseManager {
    static let shared = DatabaseManager()
    private init() {}
    
    let database = Database.database().reference()
    
    func createTask(taskContent: String, completion: @escaping (Bool) -> Void) {
        guard let userId = Auth.auth().currentUser?.uid else { return }

        let taskId = UUID().uuidString
        let date = getCurrentDate()
        let task = Task(content: taskContent, taskId: taskId, date: date)
        let taskDict = Task.getTaskDict(task:task)
        
        database.child(TaskKeyName.users).child(userId).child(TaskKeyName.tasks).observeSingleEvent(of: .value) { snapshot in
            if var taskArr = snapshot.value as? [[String:Any]],
               taskArr.count > 0 {
                // update the existing task array
                
                taskArr.append(taskDict)
                self.addTaskToFirebase(userId: userId, taskArr: taskArr, completion: completion)
                
            } else {
                // Create a new task array
                self.addTaskToFirebase(userId: userId, taskArr: [taskDict], completion: completion)
            }
        }
    }
    
    func addTaskToFirebase(userId: String, taskArr:[[String:Any]], completion: @escaping (Bool) -> Void) {
        self.database.child(TaskKeyName.users).child(userId).child(TaskKeyName.tasks).setValue(taskArr) { error, _ in
            if let error =  error {
                print(error.localizedDescription)
                completion(false)
                return
            }
            
            completion(true)
        }
    }
    
    func getAllTask(completion:@escaping ([Task]? , Error?) -> Void) {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        database.child(TaskKeyName.users).child(userId).child(TaskKeyName.tasks).observeSingleEvent(of: .value) { snapshot in
            if let taskArr = snapshot.value as? [[String:Any]],
               taskArr.count > 0 {
                
                let taskObjArr = taskArr.map { taskDict -> Task in
                    let task = Task.getTaskObj(taskDict: taskDict)
                    return task
                }
                
                completion(taskObjArr, nil)
            } else {
                let error = CustomError(title: "Failed", description: "Cant fetch Tasks")
                completion(nil, error)
            }
        }
    }
    
    func getCurrentDate() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        let dateStr = dateFormatter.string(from: date)
        return dateStr
    }
}

struct Task {
    let content: String
    let taskId: String
    let date: String
    
    static func getTaskDict(task:Task) -> [String:Any] {
       return [TaskKeyName.content: task.content,
               TaskKeyName.taskId: task.taskId,
               TaskKeyName.date: task.date]
    }
    
    static func getTaskObj(taskDict:[String:Any]) -> Task {
        return Task(content: taskDict[TaskKeyName.content] as! String,
                    taskId: taskDict[TaskKeyName.content] as! String,
                    date: taskDict[TaskKeyName.content] as! String)
    }
}

struct CustomError: Error {
    let title: String
    let description: String
}
