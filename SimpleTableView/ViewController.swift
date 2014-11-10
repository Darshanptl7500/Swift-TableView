//
//  ViewController.swift
//  SimpleTableView
//
//  Created by Darshan on 09/11/14.
//  Copyright (c) 2014 Darshan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
  
    @IBOutlet var tblView: UITableView!
    var city : [String] = ["New york", "Washington", "New jersy"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.automaticallyAdjustsScrollViewInsets=false
        
        self.navigationItem.title="Table View"
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return city.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tblView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        cell.textLabel.text = self.city[indexPath.row]
        
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let alertController = UIAlertController(title: "Clicked", message: "City: \(self.city[indexPath.row]) is clicked ", preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "OK", style: .Cancel) { (action
            ) -> Void in
            
            println("Cancel clicked")
            
        }
        alertController.addAction(cancelAction)
        
        self.presentViewController(alertController, animated: true) { () -> Void in
            
        }
    }
}

