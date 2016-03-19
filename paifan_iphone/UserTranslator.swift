//
//  UserTranslator.swift
//  paifan_iphone
//
//  Created by 刀之魂 on 16/3/19.
//  Copyright © 2016年 杭州个范科技有限公司. All rights reserved.
//

import Foundation

class UserTranslator {
	
	func parseUserItem(json: NSDictionary) -> User {
		let user = User()
		
		var userId = json.objectForKey("userid") as? Int
		if (userId == nil) {
			userId = json.objectForKey("id") as? Int
		}
		user.userId = userId!
		
		var nickName = json.objectForKey("nickName") as? String
		if (nickName == nil) {
			nickName = json.objectForKey("nickname") as? String
		}
		if (nickName != nil) { user.nickName = nickName! }
		
		var authorName = json.objectForKey("authorName") as? String
		if (authorName == nil) {
			authorName = json.objectForKey("authorname") as? String
		}
		if (authorName != nil) { user.nickName = authorName! }
		
		var avatar = json.objectForKey("authoravatar") as? String
		if (avatar == nil) {
			avatar = json.objectForKey("authorAvatar") as? String
		}
		if (avatar == nil) {
			avatar = json.objectForKey("avatar") as? String
		}
		if (avatar != nil) { user.avatar = avatar! }
		
		var role = json.objectForKey("authorRole") as? String
		if (role == nil) { role = json.objectForKey("authorrole") as? String }
		if (role != nil) { user.role = role! }
		
		let summary = json.objectForKey("summary") as? String
		if (summary != nil) { user.description = summary! }
		
		let canPost = json.objectForKey("canPost") as? Bool
		if (canPost != nil) { user.canPost = canPost! }
		
		return user
		
	}
	
}