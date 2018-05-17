//
//  MarketplaceAddPostVIewController.swift
//  Muzik
//
//  Created by Silvia Rodriguez on 5/7/18.
//  Copyright © 2018 Silvia Rodriguez. All rights reserved.
//

import UIKit
import Firebase

class MarketplaceAddPostViewController: UIViewController {
    
    @IBOutlet weak var postTitle: UITextField!
    @IBOutlet weak var contactInfo: UITextField!
    @IBOutlet weak var postBtn: UIButton!
    var refPosts: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        refPosts = Constants.refs.databaseMarketPosts
        postBtn.addTarget(self, action: #selector(self.addPost(_:)), for: .touchUpInside)
    }
    
    func addMarketPost(){
        let key = refPosts.childByAutoId().key

        let post = ["id":key,
                    "postTitle":postTitle.text! as String,
                    "contactInfo":contactInfo.text! as String
                    ]

        refPosts.child(key).setValue(post)
    }
    
    @objc func addPost(_ sender: UITapGestureRecognizer){
        addMarketPost()
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
