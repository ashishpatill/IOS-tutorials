//
//  RecipeCell.swift
//  GetDataFromApi
//
//  Created by Ashish Pisey on 17/10/21.
//

import UIKit

class RecipeCell: UITableViewCell {

    @IBOutlet weak var receipeName: UILabel!
    @IBOutlet weak var receipeImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
