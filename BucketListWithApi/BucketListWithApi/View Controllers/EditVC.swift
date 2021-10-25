//
//  EditVC.swift
//  BucketListWithApi
//
//  Created by Ashish Pisey on 25/10/21.
//

import UIKit
import SwiftUI

protocol EditVCDelegate: NSObjectProtocol {
    func taskCreated()
}

enum TaskType {
    case edit
    case add
}

class EditVC: UIViewController {
    var taskItem : TaskModel?
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    var taskType : TaskType?
    weak var delegate: EditVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskTextField.text = taskItem?.objective
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - check task type and perform the operation
    @IBAction func saveTask(_ sender: UIButton) {
        switch taskType {
        case .edit:
            updateTask()
        case .add:
            addTask()
        case .none:
            print("Unknown error")
        }
    }
    
    //MARK: - Add Task
    func addTask() {
        // check if textfield has text
        guard let objective = taskTextField.text else { return }
        
        TaskApiManager.addTask(objective: objective) { task, error in
            // error handling
            // you can show error with alert controller
            guard task != nil else {
                print(error?.localizedDescription ?? "Error")
                return
            }
            
            print(task!.objective)
            
            self.delegate?.taskCreated()
            DispatchQueue.main.async {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    //MARK: - Update Task
    func updateTask() {
        // check if textfield has text and taskItem is received from TaskListVC
        guard let objective = taskTextField.text else { return }
        guard let taskItem = taskItem else { return }
        
        TaskApiManager.updateTask(id: taskItem.id, objective: objective) { task, error in
            // error handling
            // you can show error with alert controller
            guard task != nil else {
                print(error?.localizedDescription ?? "Error")
                return
            }
            
            self.delegate?.taskCreated()
            DispatchQueue.main.async {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    

}
