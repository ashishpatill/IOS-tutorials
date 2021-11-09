//
//  SecondViewController.swift
//  FBLogin
//
//  Created by Ashish Pisey on 09/11/21.
//

import UIKit
import Firebase
import CoreData
class SecondViewController: UIViewController {
    var taskObjectArr: [TaskEntity]?
    var taskArr: [Task]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        DatabaseManager.shared.createTask(taskContent: "Task 2") { isInserted in
            if isInserted {
                DatabaseManager.shared.getAllTask { taskArr, error in
                    guard let taskArr = taskArr else {
                        print(error?.localizedDescription ?? "Error")
                        return
                    }
                    
                    self.taskArr = taskArr
                    self.deleteAllData()
                }
            }
        }
    }
    
    func saveTasksToCoreData(taskArr: [Task]) {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        var entity = TaskEntity.init(context: context)
        for task in taskArr {
            entity = NSEntityDescription.insertNewObject(forEntityName: "TaskEntity", into: context) as! TaskEntity
            entity.taskId = task.taskId
            entity.date = task.date
            entity.content = task.content
        }
        
        do {
           try context.save()
            self.taskObjectArr = readTasksFromCoreData()
            print(taskObjectArr!.count)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteAllData() {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>.init(entityName: "TaskEntity")
        let deleteRequest = NSBatchDeleteRequest.init(fetchRequest: fetchRequest)
        
        //deleteRequest.resultType = .resultTypeObjectIDs

        do {
            // Execute the request.
            let deleteResult = try context.execute(deleteRequest) as? NSBatchDeleteResult
            
            // Extract the IDs of the deleted managed objectss from the request's result.
            if let objectIDs = deleteResult?.result as? [NSManagedObjectID] {

                // Merge the deletions into the app's managed object context.
                NSManagedObjectContext.mergeChanges(
                    fromRemoteContextSave: [NSDeletedObjectsKey: objectIDs],
                    into: [context]
                )
            }
            saveTasksToCoreData(taskArr: self.taskArr!)
            

        } catch {
            // Handle any thrown errors.
        }
        
    }
    
    func getTasksfromCoredata() -> [TaskEntity]? {
        guard let taskObjectArr = readTasksFromCoreData() else { return nil}
        print("task count: \(taskObjectArr.count)")
        return taskObjectArr
    }
    
    func readTasksFromCoreData() -> [TaskEntity]? {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>.init(entityName: "TaskEntity")
        
        do {
            let result = try context.fetch(request)
            let entityArr = result as! [TaskEntity]
            return entityArr
        }catch {
            print(error.localizedDescription)
        }
        
        return nil
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
