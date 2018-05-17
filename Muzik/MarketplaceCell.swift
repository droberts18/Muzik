//
//  MarketplaceCell.swift
//  Muzik
//
//  Created by Silvia Rodriguez on 5/7/18.
//  Copyright © 2018 Silvia Rodriguez. All rights reserved.
//

import UIKit

class MarketplaceCell: UITableViewCell {
    @IBOutlet weak var headingTitle: UILabel!
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var contactInfo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        isUserInteractionEnabled = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
