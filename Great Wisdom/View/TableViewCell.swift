//
//  TableViewCell.swift
//  Great Wisdom
//
//  Created by ACS on 18.02.2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var imageIcon: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
