//
//  ViewController.swift
//  04PullRefreshy
//
//  Created by sven on 16/12/25.
//  Copyright © 2016年 sven. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    // tableView + 刷新控件
    var tableViewController = UITableViewController(style:.Plain)
    var refreshControl = UIRefreshControl() // 控制器才有refreshControl
    
    let cellID = "cellID"
    
//    let dataSource = NSMutableArray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.view.addSubview(tableView)
//        self.refreshControl = tableViewController.refreshControl! // tableViewController才有refreshControl
        
        tableViewController.refreshControl = refreshControl // 给tableViewControlller添加 已经存在的 refreshControll
        self.refreshControl.addTarget(self, action: #selector(ViewController.addEmoji), forControlEvents: .ValueChanged)
        let tableViwe = tableViewController.tableView
        tableViwe.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellID)
        self.view.addSubview(tableViwe)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func addEmoji() ->  (){
        // 添加数组元素
        
        self.tableViewController.tableView.reloadData()
        
        self.refreshControl.endRefreshing()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellID)!
        cell.textLabel?.text = String(indexPath.row)
        return cell
    }
}

