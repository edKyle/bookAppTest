//
//  bookNameTableViewCell.swift
//  bookApp
//
//  Created by Kyle on 7/22/16.
//  Copyright © 2016 Alphacamp. All rights reserved.
//

import UIKit

class bookNameTableViewCell: UITableViewCell {

    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
