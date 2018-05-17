//
//  LoginViewController.swift
//  Muzik
//
//  Created by Silvia Rodriguez on 3/21/18.
//  Copyright © 2018 Silvia Rodriguez. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signUpUser(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "SignUp")
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func tryLogin(_ sender: Any) {
        print("login button hit");
        
        Auth.auth().signIn(withEmail: usernameTextField.text!, password: passwordTextField.text!) { (user, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            print("successfully logged in")
            
            let storyboard = UIStoryboard(name: "Main" , bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "loggedIn")
            self.present(controller, animated: true, completion: nil)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
