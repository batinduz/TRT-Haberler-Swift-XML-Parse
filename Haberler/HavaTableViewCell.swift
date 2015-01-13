//
//  HavaTableViewCell.swift
//  Haberler
//
//  Created by Batin DUZ on 23.12.2014.
//  Copyright (c) 2014 Batin DUZ. All rights reserved.
//

import UIKit

class HavaTableViewCell: UITableViewCell {

    @IBOutlet var cityLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    func setCell (city: String) {
        
        cityLabel.text = city
        
    }
}
