//
//  Article.swift
//  paifan_iphone
//
//  Created by 刀之魂 on 16/1/10.
//  Copyright © 2016年 杭州个范科技有限公司. All rights reserved.
//

import UIKit

class Article {
	var articleId: Int
	var serverReference: String
	var creationTime: NSDate = NSDate()
	var likeCount: Int = 0
	var title: String
	var photo: UIImage? = nil
	var description: String = ""
	var tags: String = ""
	var userId: Int = 0
	var liked: Bool = false
	
	init(articleId: Int, serverReference: String, title: String) {
		self.articleId = articleId;
		self.serverReference = serverReference;
		self.title = title;
	}
}