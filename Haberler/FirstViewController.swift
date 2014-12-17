//
//  FirstViewController.swift
//  Haberler
//
//  Created by Batin DUZ on 13.12.2014.
//  Copyright (c) 2014 Batin DUZ. All rights reserved.
//

import UIKit
var parser: NSXMLParser = NSXMLParser()

class FirstViewController: UIViewController,  UITableViewDataSource, UITableViewDelegate, NSXMLParserDelegate {
    @IBOutlet weak var tableView: UITableView!

    var parser: NSXMLParser = NSXMLParser()
    var postTitle: String = String()
    var postImage: String = String()
    var eName: String = String()
    var tableData = [String]()
    var ImageData = [String]()
    let cellIdentifier = "cellIdentifier"
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cellIdentifier")

        let url = NSURL(string: "http://haberftp.trt.net.tr/haberservis/haber.aspx")
        parser = NSXMLParser(contentsOfURL: url)!
        parser.delegate = self
        parser.parse()
        tableView.dataSource = self

    }
    
    // MARK: - NSXMLParserDelegate methods
    
    func parser(parser: NSXMLParser!, didStartElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!, attributes attributeDict: [NSObject : AnyObject]!) {
        eName = elementName
        if elementName == "haber" {
            self.tableData.append("\(postTitle)")
            self.ImageData.append("\(postImage)")

            postTitle = String()
        }
    }
    
    func parser(parser: NSXMLParser!, foundCharacters string: String!) {
        let data = string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        if (!data.isEmpty) {
            if eName == "baslik" {
                NSLog(data)
                postTitle += data
            }
            if eName == "resimpath" {
                NSLog(data)
                postImage += data
            }
        }
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : GundemTableViewCell = tableView.dequeueReusableCellWithIdentifier("mycell") as GundemTableViewCell
    
        cell.setCell(tableData[indexPath.row],  image: ImageData[indexPath.row]);
        
    
        
        //cell.setCell(self.tableData[indexPath.row], Image: "test.jpg")
        //cell.titleLabel.text = "deneme"
       //cell.textLabel?.text = self.tableData[indexPath.row]
       // cell.textLabel?.text = "deneme+"

        return cell
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
}

