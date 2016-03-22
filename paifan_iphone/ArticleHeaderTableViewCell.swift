//
//  ArticleHeaderTableViewCell.swift
//  paifan_iphone
//
//  Created by baoshuguang on 16/3/23.
//  Copyright © 2016年 杭州个范科技有限公司. All rights reserved.
//

import UIKit

class ArticleHeaderTableViewCell: UITableViewCell {

	@IBOutlet weak var leftLabel: UILabel!
	
	@IBOutlet weak var middleLabel: UILabel!
	
	@IBOutlet weak var rightLabel: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
