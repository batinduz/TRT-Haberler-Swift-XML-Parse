//
//  GundemTableViewCell.swift
//  Haberler
//
//  Created by Batin DUZ on 13.12.2014.
//  Copyright (c) 2014 Batin DUZ. All rights reserved.
//

import UIKit

class GundemTableViewCell: UITableViewCell {

  
    @IBOutlet var tableImage: UIImageView!

    @IBOutlet var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
        // Configure the view for the selected state
    }
    func setCell (title: String, image: String) {
        
        titleLabel.text = title;
       // let url = NSURL.URLWithString(image);

//       tableImage?.image = UIImage(data:  NSURL(string: image))


        
    
    }
    
 
    

}
