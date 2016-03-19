//
//  ArticleTranslator.swift
//  paifan_iphone
//
//  Created by 刀之魂 on 16/3/16.
//  Copyright © 2016年 杭州个范科技有限公司. All rights reserved.
//

import Foundation

class ArticleTranslator {
	
	func parseArticleJsonItem(json: NSDictionary) -> Article {
		let article = Article()
		
		article.user = UserTranslator().parseUserItem(json)
		
		article.articleId = json.objectForKey("id") as! Int
		article.title = json.objectForKey("title") as! String
		article.photo = json.objectForKey("cover") as! String
		
		var likeCount = json.objectForKey("likecount") as? Int
		if (likeCount == nil) {
			likeCount = json.objectForKey("likeCount") as? Int
		}
		if (likeCount != nil) {
			article.likeCount = likeCount!
		}
		
		let category = json.objectForKey("category") as? String
		if (category != nil) {
			article.tags.append(category!)
		}
		
		let style = json.objectForKey("style") as? String
		if (style != nil) {
			article.tags.append(style!)
		}
		
		let occasion = json.objectForKey("occassion") as? String
		if (occasion != nil) {
			article.tags.append(occasion!)
		}
		
		let classifyName = json.objectForKey("classifyName") as? String
		if (classifyName != nil) {
			article.tags.append(classifyName!)
		}
		
		let classifyList = json.objectForKey("classifyList") as? [String]
		if (classifyList != nil) {
			for classify in classifyList! {
				article.tags.append(classify)
			}
		}
		
		let creationTime = json.objectForKey("createtime") as? String
		if (creationTime != nil) {
			article.creationTime = creationTime!
		}
		
		let description = json.objectForKey("description") as? String
		if (description != nil) {
			article.description = description!
		}
		
		let auditStatusName = json.objectForKey("auditStatusName") as? String
		if (auditStatusName != nil) {
			article.serverReference = auditStatusName!
		}
		
		let liked = json.objectForKey("liked") as? Int
		if (liked != nil) {
			article.liked = liked! > 0
		}
		
		return article
	}
	
	func parseArticleJsonItemList(json: NSArray) -> [Article] {
		var articles: [Article] = []
		for jsonItem in json {
			articles.append(parseArticleJsonItem(jsonItem as! NSDictionary))
		}
		
		return articles
	}
	
	func parseHomeInformation(json: NSDictionary) -> [Article] {
		return parseArticleJsonItemList(json.objectForKey("list") as! NSArray)
	}
	
	func parseGenderType(json: NSDictionary) -> ClassifyType {
		let stateTranslator = StateTranslator()
		let genders = json.objectForKey("sexMap")?.objectForKey("性别") as? NSArray
		
		let classifyType = ClassifyType(name: "性别")
		
		if genders == nil {
			return classifyType
		}
		
		let allGenderItem = ClassifyItem()
		allGenderItem.name = "全部"
		allGenderItem.ordinal = 0
		
		classifyType.classifyItems.append(allGenderItem)
		
		for gender in genders! {
			classifyType.classifyItems.append(stateTranslator.parseClassifyItem(gender as! NSDictionary))
		}
		
		return classifyType
	}
	
	func parseAdItem(json: NSDictionary) -> [AdPicture] {
		var adPictures: [AdPicture] = []
		
		let pictureJsons = json.objectForKey("carouseList") as? NSArray
		
		if (pictureJsons == nil) {
			return adPictures
		}
		
		for pictureJson in pictureJsons! {
			let adPicture = AdPicture()
			
			adPicture.picture = pictureJson.objectForKey("url") as! String
			
			let link = pictureJson.objectForKey("link") as? String
			if (link != nil) {
				adPicture.linkUrl = link!
			}
			
			let description = pictureJson.objectForKey("description") as? String
			if (description != nil) {
				adPicture.description = description!
			}
			
			adPictures.append(adPicture)
		}
		
		return adPictures
	}
}