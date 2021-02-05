//
//  TableViewCell.swift
//  Planner
//
//  Created by Кирилл Дутов on 05.02.2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var placeImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
