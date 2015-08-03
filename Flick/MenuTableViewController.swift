//
//  MenuTableViewController.swift
//  Flick
//
//  Created by Takaaki on 2015/08/01.
//  Copyright (c) 2015年 takaaki. All rights reserved.
//

//
//  MenuTableViewController.swift
//  ZLSwipeableViewSwiftDemo
//
//  Created by Zhixuan Lai on 5/25/15.
//  Copyright (c) 2015 Zhixuan Lai. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    let demos = ["Default"]
    let viewControllers = [ZLSwipeableViewController.self]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "ZLSwipeableView"
        
    }
    
    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count(demos)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cellIdentifier = String(format: "s%li-r%li", indexPath.section, indexPath.row)
        var cell: UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? UITableViewCell
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: cellIdentifier)
        }
        
        cell.textLabel?.text = titleForRowAtIndexPath(indexPath)
        cell.accessoryType = .DisclosureIndicator
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let title = titleForRowAtIndexPath(indexPath)
        var vc = viewControllerForRowAtIndexPath(indexPath)
        vc.title = title
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func titleForRowAtIndexPath(indexPath: NSIndexPath) -> String {
        return demos[indexPath.row]
    }
    func viewControllerForRowAtIndexPath(indexPath: NSIndexPath) -> ZLSwipeableViewController {
        return viewControllers[indexPath.row]()
    }
    
}
