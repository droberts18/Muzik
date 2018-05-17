//
//  TutorAddPostViewController.swift
//  Muzik
//
//  Created by Silvia Rodriguez on 5/8/18.
//  Copyright © 2018 Silvia Rodriguez. All rights reserved.
//

import UIKit
import Firebase

class TutorAddPostViewController: UIViewController {
    @IBOutlet weak var postBtn: UIButton!
    @IBOutlet weak var instrumentName: UITextField!
    @IBOutlet weak var contactInfo: UITextField!
    var refTutorPosts: DatabaseReference!
    var tutorName: String!
    
    var handle: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        refTutorPosts = Constants.refs.databaseTutorPosts
        postBtn.addTarget(self, action: #selector(self.addTutorPost(_:)), for: .touchUpInside)
    }
    
    func addTutorPost(){
        let key = refTutorPosts.childByAutoId().key
        
        let tutorPost = ["id":key,
                         "tutorName":tutorName,
                         "instrumentName": instrumentName.text! as String,
                         "contactInfo":contactInfo.text! as String,
                        ]
        
        refTutorPosts.child(key).setValue(tutorPost)
    }
    
    @objc func addTutorPost(_ sender: UITapGestureRecognizer){
        addTutorPost()
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                self.tutorName = user.displayName!
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
}
