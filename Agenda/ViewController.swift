//
//  ViewController.swift
//  Agenda
//
//  Created by Gisela Kottmeier on 10/13/16.
//  Copyright © 2016 Gisela Kottmeier. All rights reserved.
//

import UIKit
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView:UITableView?
    var items = NSMutableArray()
    
    override func viewWillAppear(_ animated: Bool) {
        let frame:CGRect = CGRect(x: 0, y: 100, width: self.view.frame.width, height: self.view.frame.height-100)
        self.tableView = UITableView(frame: frame)
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.view.addSubview(self.tableView!)
        
        let btn = UIButton(frame: CGRect(x: 0, y: 25, width: self.view.frame.width, height: 50))
        btn.backgroundColor = UIColor.cyan
        btn.setTitle("Add new Dummy", for: UIControlState.normal)
        btn.addTarget(self, action: #selector(ViewController.addDummyData), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btn)
        addDummyData();
    }
    func addDummyData() {
//        RestApiManager.sharedInstance.getRandomUser()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "CELL")! as UITableViewCell
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "CELL")
        }
        
        let user:JSON =  JSON(self.items[indexPath.row])
        
        let picURL = user["picture"]["medium"].string
        let url = NSURL(string: picURL!)
        let data = NSData(contentsOf: url! as URL)
        
        cell.textLabel?.text = user["username"].string
        cell.imageView?.image = UIImage(data: data! as Data)
        
        return cell
    }
}

