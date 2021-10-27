//
//  ViewController.swift
//  ToDoList
//
//  Created by Ashish Pisey on 04/10/21.
//

import UIKit

let cellIdentifier = "taskCell"

class ViewController: UIViewController, BeastCellDelegate {
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var taskDescription: UILabel!
    var total = 0.0
    
    var array = ["1", "2", "3", "4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        tableView.dataSource = self
        tableView.delegate = self
        self.taskDescription.text = "Total: \(total)"
    }

    @IBAction func beastButtonPressed(_ sender: UIButton) {
        print("Beast pressed")
    
        if let text = taskTextField.text,
           text.count > 0 {
            array.append(text)
            tableView.reloadData()
        }
    }
    
    func showTaskDescription(number: Double) {
        print("show Description pressed")
        total = total + number
        taskDescription.text = "Total: \(total)"
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! BeastListTableCell
        cell.delegate = self
        cell.descriptionLabel.text = array[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Section: \(indexPath.section) and Row: \(indexPath.row)")
        array.remove(at: indexPath.row)
        tableView.reloadData()
    }
}
