//
//  SecondViewController.swift
//  Haberler
//
//  Created by Batin DUZ on 13.12.2014.
//  Copyright (c) 2014 Batin DUZ. All rights reserved.
//

import UIKit
var sporparser: NSXMLParser = NSXMLParser()

class SecondViewController: UIViewController, UITableViewDataSource,  UITableViewDelegate, NSXMLParserDelegate {
    
    @IBOutlet var sportableView: UITableView!
    var parser: NSXMLParser = NSXMLParser()
    var postTitle: String = String()
    var postImage: String = String()
    var eName: String = String()
    var tableData = [String]()
    var ImageData = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
  
        self.sportableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
        
        let url = NSURL(string: "http://haberftp.trt.net.tr/haberservis/spor.aspx")
        sporparser = NSXMLParser(contentsOfURL: url)!
        sporparser.delegate = self
        sporparser.parse()
        sportableView.dataSource = self
    }
    // MARK: - NSXMLParserDelegate methods
    
    func parser(parser: NSXMLParser!, didStartElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!, attributes attributeDict: [NSObject : AnyObject]!) {
        eName = elementName
        if elementName == "haber" {
            self.tableData.append("\(postTitle)")
            self.ImageData.append("\(postImage)")
            
            postTitle = String()
            postImage = String()
            
            
        }
    }
    
    func parser(parser: NSXMLParser!, foundCharacters string: String!) {
        let data = string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        if (!data.isEmpty) {
            if eName == "baslik" {
                //  NSLog(data)
                postTitle += data
            }
            if eName == "resimpath" {
                //NSLog(data)
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
        
        var cell : SporTableViewCell = tableView.dequeueReusableCellWithIdentifier("mycell") as SporTableViewCell
        
        cell.setCell(tableData[indexPath.row],  image: ImageData[indexPath.row]);
       // cell.titleLabel.text="dddd"
        
        
        return cell
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

