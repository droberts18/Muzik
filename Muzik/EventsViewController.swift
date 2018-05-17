//
//  EventsViewController.swift
//  Muzik
//
//  Created by Silvia Rodriguez on 4/18/18.
//  Copyright © 2018 Silvia Rodriguez. All rights reserved.
//

import UIKit
import MapKit

class EventsViewController: UIViewController {
    @IBOutlet var eventsMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventsMap.userTrackingMode = .follow
    }
}
