//
//  BannerTableViewCell.swift
//  paifan_iphone
//
//  Created by baoshuguang on 16/3/22.
//  Copyright © 2016年 杭州个范科技有限公司. All rights reserved.
//

import UIKit
import ImagePlayerView

class BannerTableViewCell: UITableViewCell {

	@IBOutlet weak var bannerView: ImagePlayerView!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
