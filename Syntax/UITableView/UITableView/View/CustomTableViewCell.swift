//
//  CustomTableViewCell.swift
//  UITableView
//
//  Created by Jaeyoung Lee on 2021/08/27.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet var test: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
