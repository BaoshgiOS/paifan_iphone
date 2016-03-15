//
//  PaifanHttpHelper.swift
//  paifan_iphone
//
//  Created by 刀之魂 on 16/3/15.
//  Copyright © 2016年 杭州个范科技有限公司. All rights reserved.
//

import Foundation

extension String {
	var md5: String! {
		let str = self.cStringUsingEncoding(NSUTF8StringEncoding)
		let strLen = CC_LONG(self.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
		let digestLen = Int(CC_MD5_DIGEST_LENGTH)
		let result = UnsafeMutablePointer<CUnsignedChar>.alloc(digestLen)
		
		CC_MD5(str!, strLen, result)
		
		let hash = NSMutableString()
		
		for i in 0..<digestLen {
			hash.appendFormat("%02x", result[i])
		}
		
		result.dealloc(digestLen)
		
		return String(format: hash as String)
	}
}

func getRestServiceAddress() -> String {
	return "http://paifan.me"
}

func getAppServerKey() -> String {
	return "paifan-1qa2wsxz#!xcv$"
}

func getFormattedUrl(url: String, parameters: Dictionary<String, String>) -> String {
	var result = url + "?"
	var parameterString = ""
	
	let array = parameters.sort({$0.0 < $1.0})
	
	for (k, v) in array {
		parameterString = parameterString + k + "=" + v + "&"
	}
	
	let hashString = parameterString.substringToIndex(parameterString.endIndex.advancedBy(-1)) + getAppServerKey()

	
	result = result + parameterString + "sign=" + hashString.md5
	
	print(result)
	
	return result
	
}