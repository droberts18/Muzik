//
//  TutorPostModel.swift
//  Muzik
//
//  Created by Silvia Rodriguez on 5/16/18.
//  Copyright © 2018 Silvia Rodriguez. All rights reserved.
//

class TutorPostModel {
    var tutorName: String?
    var postImg: UIImage?
    var instrumentName: String?
    var contactInfo: String?
    
    init(tutorName: String?, instrumentName: String?, contactInfo: String?) {
        self.tutorName = tutorName
        self.postImg = UIImage.init(named: "guitar.jpg")
        self.instrumentName = instrumentName
        self.contactInfo = contactInfo
    }
}
