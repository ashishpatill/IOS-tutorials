//
//  ViewController.swift
//  BucketListWithCoreData
//
//  Created by Ashish Pisey on 12/10/21.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    let entityName = "TaskListItem"
    @IBOutlet weak var myTextField: UITextField!
    let identifier = "TaskCell"
    @IBOutlet weak var myTableView: UITableView!
    var itemList: [NSManagedObject] = []
    // NSManagedObject => Class
    // Entity => Blueprint for NSManaged object
    // Context => SnapShot of your data at any time
    // persistentContainer => an instance of your data base
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTableView.dataSource = self
        readItem()
    }
    
    //MARK: - Get updated context, to avoid having global object for your context
    func getUpdatedContext() -> NSManagedObjectContext? {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        return delegate.persistentContainer.viewContext
    }
    
    @IBAction func AddItem(_ sender: UIButton) {
        if let task = myTextField.text {
            addItem(name: task)
        }
    }
    
    @IBAction func updateAction(_ sender: UIButton) {
        updateItem()
    }
    
    @IBAction func deleteItem(_ sender: UIButton) {
        delete()
    }
    
    //MARK: - Add items to data base
    func addItem(name:String) {
        guard let context = getUpdatedContext() else {
            return
        }
        
        // Add age values for given name
        // Just to have an entity with multiple attributes
        let item = TaskListItem.init(context: context)
        item.name = name
        if name == "ashish" {
            item.age = Int16(30)
        } else if name == "rodrigo" {
            item.age = Int16(31)
        } else {
            item.age = Int16.random(in: 20...99)
        }
        
        do {
            try context.save()
            print("Save successful")
            itemList.append(item)
            myTableView.reloadData()
        } catch {
            print("Save Error: \(error)")
        }
    }
    
    //MARK: - Read items from data base
    func readItem() {
        guard let context = getUpdatedContext() else {
            return
        }
        
        let request = NSFetchRequest<NSFetchRequestResult>.init(entityName: entityName)
        do {
            let result = try context.fetch(request)
            itemList = result as! [TaskListItem]
            myTableView.reloadData()
        } catch {
            print("Read Error:\(error)")
        }
    }
    
    //MARK: - Update with single predicate
    func updateItem() {
        // fetching an item
        guard let context = getUpdatedContext() else {
            return
        }
        
        // read
        let request = NSFetchRequest<NSFetchRequestResult>.init(entityName: entityName)
        let predicate = NSPredicate.init(format: "name = %@", "ashish")
        request.predicate = predicate
        do {
            let result = try context.fetch(request).first
            let task = result as! TaskListItem
            task.name = "ashish 2"
            
            
            try context.save()
            readItem()

            /*
            do {
                try context.save()
                readItem()
            } catch {
                print("Save Error: \(error)")
            }*/
        } catch {
            print("Fetch Error:\(error)")
        }
    }
    
    //MARK: - Update with Multiple predicate
    func updateItemWithMultiplePredicates() {
        // fetching an item
        guard let context = getUpdatedContext() else {
            return
        }
        
        // read
        let request = NSFetchRequest<NSFetchRequestResult>.init(entityName: entityName)
        let predicate1 = NSPredicate.init(format: "name = %@", "ashish")
        let predicate2 = NSPredicate.init(format: "age = %d", 30)
        
        request.predicate = NSCompoundPredicate.init(andPredicateWithSubpredicates: [predicate1, predicate2])
        do {
            // update the 1st item matching the criteria
            let result = try context.fetch(request).first
            let taskListItem = result as! TaskListItem
            taskListItem.name = "ashish 2"
            
            try context.save()
            readItem()
            
        } catch {
            print("Fetch Error:\(error)")
        }
    }
    
    //MARK: - Delete object for a given value
    func delete() {
        guard let context = getUpdatedContext() else {
            return
        }
        
        let request = NSFetchRequest<NSFetchRequestResult>.init(entityName: entityName)
        request.predicate = NSPredicate.init(format: "task = %@", "ashish")
        
        do {
            let item = try context.fetch(request).first as! TaskListItem
            context.delete(item)
            try context.save()
            readItem()
        } catch {
            print(error)
        }
    }
    
}

extension ViewController :UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! TaskCell
        let taskItem = itemList[indexPath.row] as! TaskListItem
        cell.taskName.text = "name: \(taskItem.name!), age: \(taskItem.age)"
        return cell
    }
}

//
