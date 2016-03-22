//
//  FirstViewController.swift
//  paifan_iphone
//
//  Created by 刀之魂 on 16/1/6.
//  Copyright © 2016年 杭州个范科技有限公司. All rights reserved.
//

import UIKit


class FindViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	
    @IBOutlet weak var tableView: UITableView!
	
	var articles:[Article] = []
	let articleCellIdentifier = "ArticleFolderTableViewCell"
	
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
		
		//let menu_button_ = UIBarButtonItem(image: UIImage(named: "genderType"), style: UIBarButtonItemStyle.Plain, target: self, action: "OnGenderMenuClicked:")
		
		let menu_button_ = UIButton()
		menu_button_.frame = CGRectMake(0, 0, 51, 31)
		menu_button_.setImage(UIImage(named: "genderType"), forState: .Normal)
		menu_button_.addTarget(self, action: "genderButtonPressed:", forControlEvents: .TouchUpInside)
		
		let menu_button = UIBarButtonItem()
		menu_button.customView = menu_button_
		
		self.navigationItem.rightBarButtonItem = menu_button
		
        self.title = "拍范"
		
		tableView.registerNib(UINib(nibName: articleCellIdentifier, bundle: nil), forCellReuseIdentifier: articleCellIdentifier)
		
		tableView.tableFooterView = UIView()
		
		tableView.delegate = self
		tableView.dataSource = self
		
		
		
		ArticleServiceInterface().sendHomeInformationRequest(nil, genderId: nil, classifyId: nil, page: 1, completeCallback: { articles in
			    self.articles = articles
				self.tableView.reloadData()
			})
		
		}
	
	func genderButtonPressed(sender: UIButton) {
		
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return articles.count
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 5
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier(articleCellIdentifier, forIndexPath: indexPath) as! ArticleFolderTableViewCell
		
		let row = indexPath.section
		cell.authorNameLabel.text = articles[row].user.nickName
		cell.authorRoleLabel.text = articles[row].user.role
		cell.titleLabel?.text = articles[row].title
		cell.folderImageView.sd_setImageWithURL(NSURL(string: articles[row].photo),
			placeholderImage: UIImage(named: "genderType"))
		cell.authorImageView.sd_setImageWithURL(NSURL(string: articles[row].user.avatar), placeholderImage: UIImage(named: "genderType"))
		return cell
	}
	
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		tableView.deselectRowAtIndexPath(indexPath, animated: true)
		
		let row = indexPath.row
		print(articles[row])
	}
	
	func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		return 537
	}
	
}

