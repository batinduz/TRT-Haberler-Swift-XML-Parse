//
//  HDetayTableViewCell.swift
//  Haberler
//
//  Created by Batin DUZ on 13.01.2015.
//  Copyright (c) 2015 Batin DUZ. All rights reserved.
//

import UIKit

class HDetayTableViewCell: UITableViewCell {

    @IBOutlet var tarih: UILabel!
    @IBOutlet var endusukLabel: UILabel!
    @IBOutlet var enyuksekLabel: UILabel!
    @IBOutlet var durumImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCell (gtarih: String, endusuk: String, enyuksek: String, durum: String) {
        let yil = (gtarih as NSString).substringWithRange(NSMakeRange(0, 2))
        let ay = (gtarih as NSString).substringWithRange(NSMakeRange(2, 2))
       let gun = (gtarih as NSString).substringWithRange(NSMakeRange(4, 2))


        tarih.text = gun+"/"+ay+"/20"+yil
        endusukLabel.text = endusuk + " °C"
        enyuksekLabel.text = enyuksek + " °C"
        var imageView = UIImageView(frame: CGRectMake(100, 150, 150, 150));
       
        var imagename = "parcalibulutlu.png"
        println(durum)
        if durum == "PB" {
         imagename = "kar.png"
        }else if durum == "Y" {
          let imagename =  "yagisli.png"
   
        
    }else if durum == "KSY" {
            imagename =  "yagisli.png"
    
    }
        else if durum == "KKY" {
        imagename =  "kar.png"
            
        }
      
        var image = UIImage(named: imagename)
            durumImage.image = image;
        
        
    }
    
}
