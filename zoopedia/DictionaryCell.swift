//
//  DictionaryCell.swift
//  zoopedia
//
//  Created by Nadya on 8/27/17.
//  Copyright © 2017 Nadya. All rights reserved.
//

import UIKit

class DictionaryCell: UITableViewCell {

    @IBOutlet weak var img:UIImageView?
    @IBOutlet weak var title:UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
