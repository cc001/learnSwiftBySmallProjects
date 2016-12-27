//
//  SwipeableCell.swift
//  SwipeableCell
//
//  Created by 陈闯 on 2016/12/27.
//  Copyright © 2016年 CC. All rights reserved.
//

import UIKit

struct pattern {
    let image: String
    let name: String
}

class SwipeableCell: UITableViewCell {

    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
