//
//  ArticleFolderTableViewCell.swift
//  paifan_iphone
//
//  Created by baoshuguang on 16/3/21.
//  Copyright © 2016年 杭州个范科技有限公司. All rights reserved.
//

import UIKit

class ArticleFolderTableViewCell: UITableViewCell {
	
	@IBOutlet weak var authorImageView: UIImageView!
	@IBOutlet weak var authorNameLabel: UILabel!
	@IBOutlet weak var authorRoleLabel: UILabel!
	@IBOutlet weak var folderImageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorTags: TLTagsControl!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		
		authorRoleLabel.layer.masksToBounds = true
		authorRoleLabel.layer.cornerRadius = 4
		
		authorTags.tagsBackgroundColor = UIColor.whiteColor();
		authorTags.tagsTextColor = UIColor.orangeColor();
		authorTags.mode =  TLTagsControlMode.List
		
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
