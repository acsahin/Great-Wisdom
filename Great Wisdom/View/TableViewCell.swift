//
//  TableViewCell.swift
//  Great Wisdom
//
//  Created by ACS on 17.02.2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var customCell: UIView!
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
