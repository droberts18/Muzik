//
//  TutorCell.swift
//  Muzik
//
//  Created by Silvia Rodriguez on 5/8/18.
//  Copyright © 2018 Silvia Rodriguez. All rights reserved.
//

import UIKit

class TutorCell: UITableViewCell {
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var tutorName: UILabel!
    @IBOutlet weak var instrumentName: UILabel!
    @IBOutlet weak var contactInfo: UILabel!
    @IBOutlet weak var tutorRating: RatingControl!
    
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
