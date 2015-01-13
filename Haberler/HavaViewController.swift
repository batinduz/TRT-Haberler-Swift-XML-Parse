//
//  HavaViewController.swift
//  Haberler
//
//  Created by Batin DUZ on 1.01.2015.
//  Copyright (c) 2015 Batin DUZ. All rights reserved.
//

import UIKit
import CoreData

class HavaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    @IBOutlet var havatableView: UITableView!
    
    var cities = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.havatableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
        havatableView.dataSource = self
        havatableView.delegate = self
        // XMl Parse
        let url = NSURL(string: "http://haberftp.trt.net.tr/haberservis/havadurumu.aspx")
        let data = NSData(contentsOfURL: url!)
     //   println(data)
        if(data != nil){
        let dataxml = NSString(data:data!, encoding: NSUTF8StringEncoding)
        let xml = SWXMLHash.parse(dataxml!)
    //  println(xml["HavaTahmini"]["Merkez"][4].element?.attributes["MerkezAdi"])
     //   println(xml["HavaTahmini"]["Merkez"][6].element?.attributes["MerkezAdi"])
    
        for merkez in xml["HavaTahmini"]["Merkez"] {
            var cityName = merkez.element?.attributes["MerkezAdi"]
         //   println(cityName)
          // self.newCity(cityName!)
            for gun in merkez["Gun"] {
              //  println(gun.element?.attributes["Tarih"])
                var tarih = gun.element?.attributes["Tarih"]
                var endusuk = gun["EnDusuk"].element?.text
                var enyuksek = gun["EnYuksek"].element?.text
                var durum = gun["DurumuKod"].element?.text

           //    self.newCityWeather(cityName!, tarih: tarih!, endusuk: endusuk!, enyuksek: enyuksek!, durum: durum! )

            }
        }
        
        
        }

        
        
        
     self.loadData()
        
        
        
        
        
        println("hava")
        // Do any additional setup after loading the view.
    }
    func newCityWeather(cityName: String, tarih: String, endusuk: String, enyuksek: String, durum: String){
        
        var appDel: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate )
        var context: NSManagedObjectContext = appDel.managedObjectContext!
        var newCity = NSEntityDescription.insertNewObjectForEntityForName("Hava", inManagedObjectContext: context) as NSManagedObject
        
        
        newCity.setValue(cityName, forKey: "sehir")
        newCity.setValue(tarih, forKey: "tarih")
        newCity.setValue(endusuk, forKey: "endusuk")
        newCity.setValue(endusuk, forKey: "enyuksek")
        newCity.setValue(endusuk, forKey: "endusuk")
        newCity.setValue(endusuk, forKey: "durum")

        context.save(nil)
        
        //  println(newCity)
        
        
    }
    func newCity(cityName: String){
    
        var appDel: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate )
        var context: NSManagedObjectContext = appDel.managedObjectContext!
        var newCity = NSEntityDescription.insertNewObjectForEntityForName("Sehirler", inManagedObjectContext: context) as NSManagedObject
        
        
        newCity.setValue(cityName, forKey: "sehir")
        context.save(nil)
        
      //  println(newCity)
        

    }
    func loadData() {
        var appDel: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate )
        var context: NSManagedObjectContext = appDel.managedObjectContext!
        
        
        var request = NSFetchRequest(entityName: "Sehirler")
        request.returnsObjectsAsFaults = false
        var results: NSArray = context.executeFetchRequest(request, error: nil)!
        if results.count>0 {
            
            for result in results {
                var res = result as NSManagedObject
                let city = res.valueForKey("sehir") as String
                cities.append("\(city)")            }
            
        }else {
            println("sonuc yok")
            
        }
        
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 81
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell : HavaTableViewCell = tableView.dequeueReusableCellWithIdentifier("mycell") as HavaTableViewCell
        var appDel: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate )
        var context: NSManagedObjectContext = appDel.managedObjectContext!
        
        
        var request = NSFetchRequest(entityName: "Sehirler")
        request.returnsObjectsAsFaults = false
        var results: NSArray = context.executeFetchRequest(request, error: nil)!
        if results.count>0 {
            var cities = [String]()

            for result in results {
                 var res = result as NSManagedObject
                let city = res.valueForKey("sehir") as String
                cities.append("\(city)")
            }
          
            cell.setCell(cities[indexPath.row])
 
            
        }
        

        
        
        
        
        return cell
    }
    
    
    override  func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showHavaDetay" {
            let detailVC: HavaDetayViewController = segue.destinationViewController as HavaDetayViewController
           let indexPath = self.havatableView.indexPathForSelectedRow()
                    let thisCity = cities[indexPath!.row]
               detailVC.selectcity = thisCity
            
        }
        
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
    


}
