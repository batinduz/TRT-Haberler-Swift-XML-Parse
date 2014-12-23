//
//  SporTableViewCell.swift
//  Haberler
//
//  Created by Batin DUZ on 23.12.2014.
//  Copyright (c) 2014 Batin DUZ. All rights reserved.
//

import UIKit

class SporTableViewCell: UITableViewCell {

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
        ImageLoader.sharedLoader.imageForUrl(image, completionHandler:{(image: UIImage?, url: String) in
            self.tableImage.image = image
        })
    
        
        
    }
}
