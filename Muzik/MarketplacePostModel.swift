//
//  MarketplacePostModel.swift
//  Muzik
//
//  Created by Silvia Rodriguez on 5/16/18.
//  Copyright © 2018 Silvia Rodriguez. All rights reserved.
//

class MarketplacePostModel {
    var postTitle: String?
    var postImg: UIImage?
    var contactInfo: String?
    
    init(postTitle: String?, contactInfo: String?) {
        self.postTitle = postTitle
        self.postImg = UIImage.init(named: "guitar.jpg")
        self.contactInfo = contactInfo
    }
}
