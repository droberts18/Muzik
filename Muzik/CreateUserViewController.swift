//
//  CreateUserViewController.swift
//  Muzik
//
//  Created by Silvia Rodriguez on 4/18/18.
//  Copyright © 2018 Silvia Rodriguez. All rights reserved.
//

import UIKit
import Firebase

class CreateUserViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var profilePhotoTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorMsg: UILabel!
    var handle: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func trySignUp(_ sender: Any) {
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (users, error) in
            if let error = error {
                self.errorMsg.text = error.localizedDescription
                return
            }
            
            if (self.nameTextField.text == "") {
                self.errorMsg.text = "Failed to create account. No name entered."
                return
            }
            
            if((self.profilePhotoTextField.text?.isURL())! && (self.profilePhotoTextField.text?.isImage())!){
                // sets default profile picture if no valid photo URL entered
                
            }
            else{
                self.profilePhotoTextField.text = "https://t3.ftcdn.net/jpg/00/64/67/80/160_F_64678017_zUpiZFjj04cnLri7oADnyMH0XBYyQghG.jpg"
            }
            
            print("created user successfully")
            let storyboard = UIStoryboard(name: "Main" , bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Login")
            self.present(controller, animated: true, completion: nil)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            
            let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
            changeRequest?.displayName = self.nameTextField.text
            changeRequest?.photoURL = URL(string: self.profilePhotoTextField.text!)
            changeRequest?.commitChanges { (error) in
                if let error = error {
                    self.errorMsg.text = error.localizedDescription
                    return
                }
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension String {
    public func isImage() -> Bool {
        let imageFormats = ["jpg", "jpeg", "png", "gif"]
        
        if let ext = self.getExtension() {
            return imageFormats.contains(ext)
        }
        return false
    }
    
    public func getExtension() -> String? {
        let ext = (self as NSString).pathExtension
        
        if(ext.isEmpty) {
            return nil
        }
        return ext
    }
    
    public func isURL() -> Bool {
        return URL(string: self) != nil
    }
}
