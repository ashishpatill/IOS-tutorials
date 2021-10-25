//
//  TaskCell.swift
//  BucketListWithApi
//
//  Created by Ashish Pisey on 25/10/21.
//

import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet weak var taskName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //setupLabel()
    }
    
    func setupLabel() {
        taskName.layer.borderWidth = 0.5
        taskName.layer.borderColor = UIColor.darkGray.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
