//
//  NewsTableViewCell.swift
//  SlideMenu
//
//  Created by 陈闯 on 2016/12/22.
//  Copyright © 2016年 CC. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postAuthor: UILabel!
    @IBOutlet weak var authorImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        authorImageView.layer.cornerRadius = 25
        authorImageView.clipsToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
