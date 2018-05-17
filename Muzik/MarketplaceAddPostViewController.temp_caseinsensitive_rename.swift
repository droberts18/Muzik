//
//  MarketplaceAddPostViewController.swift
//  Muzik
//
//  Created by Silvia Rodriguez on 5/7/18.
//  Copyright © 2018 Silvia Rodriguez. All rights reserved.
//

import UIKit

class MarketplaceAddPostViewController: UIViewController {
    @IBOutlet weak var postBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tapGesture = UITapGestureRecognizer(target: self, action: Selector(("normalTap")))
        
        postBtn.addGestureRecognizer(tapGesture);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func normalTap(){
        dismiss(animated: true, completion: nil)
    }
}
