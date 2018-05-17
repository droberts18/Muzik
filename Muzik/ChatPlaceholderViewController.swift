//
//  ChatPlaceholderViewController.swift
//  Muzik
//
//  Created by Silvia Rodriguez on 5/15/18.
//  Copyright © 2018 Silvia Rodriguez. All rights reserved.
//

import UIKit

class ChatPlaceholderViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.hidesBottomBarWhenPushed = false
        
        if(segue.identifier == "ChatViewController"){
            let vc: ChatPlaceholderViewController = segue.destination as! ChatPlaceholderViewController
            vc.hidesBottomBarWhenPushed = true
        }
    }
}
