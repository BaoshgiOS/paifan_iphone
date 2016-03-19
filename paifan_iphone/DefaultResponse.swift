//
//  DefaultResponse.swift
//  paifan_iphone
//
//  Created by 刀之魂 on 16/3/16.
//  Copyright © 2016年 杭州个范科技有限公司. All rights reserved.
//

import Foundation

class DefaultResponse {
	var statusCode: String
	var message: String
	var data: NSDictionary
	
	func succeed() -> Bool {
		return statusCode == "200"
	}
	
	init(statusCode:String, message:String, data:NSDictionary) {
		self.statusCode = statusCode
		self.message = message
		self.data = data
	}
}

func parseDefaultResponse(json:NSDictionary) -> DefaultResponse {
		let statusCode = json.objectForKey("status") as! String
		let message = json.objectForKey("message")as! String
		let data = json.objectForKey("data") as! NSDictionary
	
		return DefaultResponse(statusCode: statusCode, message: message, data: data)
}