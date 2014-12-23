//
//  DovizViewController.swift
//  Haberler
//
//  Created by Batin DUZ on 23.12.2014.
//  Copyright (c) 2014 Batin DUZ. All rights reserved.
//

import UIKit
var dovizparser: NSXMLParser = NSXMLParser()

class DovizViewController: UIViewController, UITableViewDataSource,  UITableViewDelegate, NSXMLParserDelegate {
    @IBOutlet var doviztableView: UITableView!

    var parser: NSXMLParser = NSXMLParser()
    var postCins: String = String()
    var postAlis: String = String()
    var postSatis: String = String()

    var eName: String = String()
    var tableData = [String]()
    var AlisData = [String]()
    var SatisData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.doviztableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
        
        let url = NSURL(string: "http://haberftp.trt.net.tr/haberservis/doviz.aspx")
        dovizparser = NSXMLParser(contentsOfURL: url)!
        dovizparser.delegate = self
        dovizparser.parse()
       println(tableData.count)
        //println(ImageData)
        
       doviztableView.dataSource = self
    }
    // MARK: - NSXMLParserDelegate methods
    
    func parser(parser: NSXMLParser!, didStartElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!, attributes attributeDict: [NSObject : AnyObject]!) {
        eName = elementName
        
        if elementName == "haber" {

            self.tableData.append("\(postCins)")
            
            self.AlisData.append("\(postAlis)")
            self.SatisData.append("\(postSatis)")

            postCins = ""
            postAlis = String()
            postSatis = ""
            
        }
    }
    
    func parser(parser: NSXMLParser!, foundCharacters string: String!) {
        let data = string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        if (!data.isEmpty) {
            if eName == "bolum" {
                //  NSLog(data)
                postCins += data

            }
            if eName == "alis" {
                //NSLog(data)
                postAlis += data
            }
            if eName == "satis" {
                //NSLog(data)
                postSatis += data
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
        
        var cell : DovizTableViewCell = tableView.dequeueReusableCellWithIdentifier("mycell") as DovizTableViewCell
        
        cell.setCell(tableData[indexPath.row],  alis: AlisData[indexPath.row], satis: SatisData[indexPath.row]);
        
    
        // cell.cinsLabel=table
        
        
        return cell
    }
    
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
