//
//  BeastListTableCell.swift
//  ToDoList
//
//  Created by Ashish Pisey on 05/10/21.
//

import UIKit

protocol BeastCellDelegate: NSObjectProtocol {
    func showTaskDescription(number: Double)
}

class BeastListTableCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var showButton: UIButton!
    weak var delegate: BeastCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func showButtonPressed(_ sender: UIButton) {
        // call a method in view controller
        if let textFieldText = descriptionLabel.text,
           let number = Double(textFieldText) {
            delegate?.showTaskDescription(number: number)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
