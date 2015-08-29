//
//  ViewController.swift
//  PullToRefresh
//
//  Created by John Lima on 8/28/15.
//  Copyright © 2015 John Lima. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK:
    // MARK: properties
    @IBOutlet var table: UITableView!
    
    var tableData: NSMutableArray = NSMutableArray()
    var refreshControl: UIRefreshControl!
    var num: Int = 0
    
    // MARK:
    // MARK: view lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
        
        let background = UIView(frame: CGRectZero)
        table.tableFooterView = background
        table.backgroundColor = UIColor.whiteColor()
        
        createRefresh()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK:
    // MARK: actions
    func createRefresh() {
    
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
        table.addSubview(refreshControl)
        
    }
    
    func refresh(sender:AnyObject) {
        
        print("REFRENSHING...")
        num += 1
        tableData.addObject("Row \(num)")
        table.reloadData()
        refreshControl.endRefreshing()
        
    }
    
    // MARK:
    // MARK: table view datasource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = table.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = tableData.objectAtIndex(indexPath.row) as? String
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Pull to refresh"
    }
    
    // MARK:
    // MARK: table view delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        table.deselectRowAtIndexPath(indexPath, animated: true)
    }

}

