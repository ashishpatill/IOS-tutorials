//
//  ViewController.swift
//  BucketListWithApi
//
//  Created by Ashish Pisey on 25/10/21.
//

import UIKit

class TaskListVC: UIViewController {

    @IBOutlet weak var TaskTableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    var taskList: [TaskModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        TaskTableView.dataSource = self
        TaskTableView.delegate = self
        getAllTasks()
        setupTitle()
    }
    
    func setupTitle() {
        addButton.layer.cornerRadius = 5
        addButton.backgroundColor = .darkGray
        addButton.setTitleColor(.white, for: .normal)
        addButton.setTitleColor(.red, for: .highlighted)
        addButton.layer.masksToBounds = true
        //addButton.layer.shadowColor = UIColor.black.cgColor
        //addButton.layer.shadowOffset = CGSize(width: 5, height: 5)
    }
    
    func getAllTasks() {
        TaskApiManager.getAllTasks { taskList, error in
            guard let tasks = taskList else { return }
            self.taskList = tasks
            DispatchQueue.main.async {
                self.TaskTableView.reloadData()
            }
        }
    }

    @IBAction func addTask(_ sender: UIButton) {
        goToEditVC(taskType:.add)
    }
    
    //MARK: Navigation logic
    func goToEditVC(taskItem:TaskModel? = nil, taskType: TaskType) {
        let editVC = self.storyboard?.instantiateViewController(withIdentifier: "EditScreen") as! EditVC
        editVC.delegate = self
        editVC.taskItem = taskItem
        editVC.taskType = taskType // task operation type
        self.navigationController?.pushViewController(editVC, animated: true)
    }
}

//MARK: - TableView datasource, delegates
extension TaskListVC : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell") as! TaskCell
        cell.taskName.text = taskList[indexPath.row].objective
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let taskItem = taskList[indexPath.row]
        goToEditVC(taskItem: taskItem, taskType: .edit)
    }
}

//MARK: - Edit VC custom delegate
extension TaskListVC : EditVCDelegate {
    func taskCreated() {
        getAllTasks()
    }
}

