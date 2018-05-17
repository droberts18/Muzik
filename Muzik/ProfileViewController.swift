//
//  ProfileViewController.swift
//  Muzik
//
//  Created by Silvia Rodriguez on 5/15/18.
//  Copyright © 2018 Silvia Rodriguez. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {
    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    var handle: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        userPhoto.layer.cornerRadius = 25
        userPhoto.layer.masksToBounds = true
        userPhoto.contentMode = UIViewContentMode.scaleAspectFit
        
        viewWillAppear(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                let userDisplayName = user.displayName
                print(user.displayName!)
                print(userDisplayName!)
                self.name.text = userDisplayName!
                let url = user.photoURL
                var data: Data
                if url != nil{
                    data = try! Data(contentsOf: url!)
                    self.userPhoto.image = UIImage(data: data)
                }
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
