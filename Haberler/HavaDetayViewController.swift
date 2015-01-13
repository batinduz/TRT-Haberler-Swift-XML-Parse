//
//  HavaDetayViewController.swift
//  Haberler
//
//  Created by Batin DUZ on 1.01.2015.
//  Copyright (c) 2015 Batin DUZ. All rights reserved.
//

import UIKit
import CoreData

class HavaDetayViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var detayHavaModel: [HavaDetayModel] = []
    var selectcity: String = String()
 
    @IBOutlet var sehirLabel: UILabel!
    @IBOutlet var havaDetayTableView: UITableView!
    
    var tarih = [String]()
    var endusuk = [String]()
    var enyuksek = [String]()
    var durum = [String]()
    
    
    override func viewDidLoad() {
      sehirLabel.text = selectcity
        self.havaDetayTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
        havaDetayTableView.dataSource = self
        havaDetayTableView.delegate = self
   
        super.viewDidLoad()
println(selectcity)
        // Do any additional setup after loading the view.
        self.loadData()
        println(endusuk)
    }
    
    func loadData() {
        var appDel: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate )
        var context: NSManagedObjectContext = appDel.managedObjectContext!
        
        
        var request = NSFetchRequest(entityName: "Hava")
        request.predicate=NSPredicate(format: "sehir = %@", ""+selectcity)
        request.returnsObjectsAsFaults = false
        var results: NSArray = context.executeFetchRequest(request, error: nil)!
        if results.count>0 {
            
            for result in results {
                var res = result as NSManagedObject
                let trh = res.valueForKey("tarih") as String
                let edusuk = res.valueForKey("endusuk") as String
                let eyuksek = res.valueForKey("enyuksek") as String
                let drm = res.valueForKey("durum") as String
                println(drm)
                tarih.append("\(trh)")
   
                endusuk.append("\(edusuk)")
                enyuksek.append("\(eyuksek)")
                durum.append("\(drm)")

 
            }

            
            
        }else {
            println("sonuc yok")
            
        }
        
        
    }
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tarih.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell : HDetayTableViewCell = tableView.dequeueReusableCellWithIdentifier("mycell") as HDetayTableViewCell
       
        
        cell.setCell(tarih[indexPath.row], endusuk: endusuk[indexPath.row], enyuksek: enyuksek[indexPath.row], durum: durum[indexPath.row])
        
        
        
        return cell
    }
    
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("click")
        println(indexPath.row)
        performSegueWithIdentifier("showHavaDetay", sender: self)
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
