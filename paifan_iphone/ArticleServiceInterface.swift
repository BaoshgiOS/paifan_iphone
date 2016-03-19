//
//  ArticleServiceInterface.swift
//  paifan_iphone
//
//  Created by 刀之魂 on 16/3/13.
//  Copyright © 2016年 杭州个范科技有限公司. All rights reserved.
//

import Foundation
import Alamofire

class ArticleServiceInterface {
	
	func sendHomeInformationRequest(userId: Int?, genderId: Int?, classifyId: String?,
		page: Int, completeCallback:(articles: [Article]) -> Void) -> Void {
			//, completeCallback:() -> Void, errorCallback:(error: String) -> Void
			var parameters:[String:String] = ["pageSize":"6", "pageNumber":String(page)]
			
			if (genderId != nil) {
				parameters["sex"] = String(genderId)
			}
			
			if (classifyId != nil) {
				parameters["classifyId"] = classifyId
			}
			
			if (userId != nil) {
				parameters["userId"] = String(userId)
			}
			
			let url = getFormattedUrl(getRestServiceAddress() + "/terminal/app/index.html", parameters: parameters)
			
			Alamofire.request(.GET, url)
				.responseJSON { response in switch response.result {
				case .Success(let JSON):
					let defaultResponse = parseDefaultResponse(JSON as! NSDictionary)
					
					if (defaultResponse.succeed()) {
						let articles = ArticleTranslator().parseHomeInformation(defaultResponse.data)
						
						completeCallback(articles: articles)
					}
					
					print(defaultResponse.message)
				case .Failure(let error):
					print(error)
				}
			}
					
		
		
			
	}
	
}