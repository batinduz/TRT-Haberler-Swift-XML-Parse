//
//  DovizTableViewCell.swift
//  Haberler
//
//  Created by Batin DUZ on 23.12.2014.
//  Copyright (c) 2014 Batin DUZ. All rights reserved.
//

import UIKit

class DovizTableViewCell: UITableViewCell {

    @IBOutlet var satisLbl: UILabel!
    @IBOutlet var satisLabel: UILabel!
    @IBOutlet var alisLabel: UILabel!
    @IBOutlet var alisLbl: UILabel!
    @IBOutlet var cinsLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setCell (cins: String, alis: String, satis: String) {
       cinsLabel.text = cins
          alisLbl.text = alis
        satisLbl.text = satis
        
    }

}
