//
//  TableViewCell.swift
//  Planner
//
//  Created by Кирилл Дутов on 05.02.2021.
//

import UIKit
import Cosmos

class TableViewCell: UITableViewCell {

    @IBOutlet weak var placeImage: UIImageView! {
        didSet {
            placeImage?.layer.cornerRadius = placeImage.frame.size.height / 2
            placeImage?.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var cosmosView: CosmosView! {
        didSet {
            cosmosView.settings.updateOnTouch = false
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
