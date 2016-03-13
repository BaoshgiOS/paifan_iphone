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
	
	let articles = ["撸管绪论", "桢哥谈撸管", "桢哥在美帝的撸管生涯", "结束撸管"]
	let articleCellIdentifier = "ArticleFolderCell"
	
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "硅谷撸管谈"
		tableView.delegate = self
		tableView.dataSource = self
		
		}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return articles.count
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier(articleCellIdentifier, forIndexPath: indexPath)
		
		let row = indexPath.row
		cell.textLabel?.text = articles[row]
		
		return cell
	}
	
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		tableView.deselectRowAtIndexPath(indexPath, animated: true)
		
		let row = indexPath.row
		print(articles[row])
	}
	
}

