//
//  StateTranslator.swift
//  paifan_iphone
//
//  Created by 刀之魂 on 16/3/18.
//  Copyright © 2016年 杭州个范科技有限公司. All rights reserved.
//

import Foundation

class StateTranslator {
	
	func parseClassifyItem(json: NSDictionary) -> ClassifyItem {
		let item = ClassifyItem()
		
		item.serverReference = String(json.objectForKey("id") as? Int)
		item.name = json.objectForKey("name") as! String
		let picture = json.objectForKey("picture") as? String
		if (picture != nil) {
			item.picture = picture!
		}
		
		item.ordinal = json.objectForKey("sort") as! Int + 1  //0=all
		
		return item
	}
	
}