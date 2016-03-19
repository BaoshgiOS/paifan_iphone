//
//  ClassifyType.swift
//  paifan_iphone
//
//  Created by 刀之魂 on 16/3/16.
//  Copyright © 2016年 杭州个范科技有限公司. All rights reserved.
//

import Foundation

class ClassifyType {
	var id: Int = 0
	var name: String = ""
	var description: String = ""
	var serverReference: String = ""
	var ordinal: Int = 0
	var classifyItems: [ClassifyItem] = []
	
	init(name: String) {
		self.name = name
	}
}