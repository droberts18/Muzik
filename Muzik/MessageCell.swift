//
//  MessageCell.swift
//  Muzik
//
//  Created by Silvia Rodriguez on 5/9/18.
//  Copyright © 2018 Silvia Rodriguez. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var messageIntro: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var messageUserName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
