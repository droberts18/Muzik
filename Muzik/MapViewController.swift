//
//  MapViewController.swift
//  Muzik
//
//  Created by Silvia Rodriguez on 5/9/18.
//  Copyright © 2018 Silvia Rodriguez. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    var locationManager = CLLocationManager()
    var eventMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        createEventMapView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        determineCurrentLocation()
    }
    
    func createEventMapView(){
        eventMap = MKMapView()
        
        let leftMargin:CGFloat = 10
        let topMargin:CGFloat = 20
        let mapWidth:CGFloat = view.frame.size.width - 20
        let mapHeight:CGFloat = 600
        
        eventMap.frame = CGRect(x: leftMargin, y: topMargin, width: mapWidth, height: mapHeight)
        
        eventMap.mapType = MKMapType.standard
        eventMap.isZoomEnabled = true
        eventMap.isScrollEnabled = true
        
        eventMap.center = view.center
        
        view.addSubview(eventMap)
    }
    
    func determineCurrentLocation(){
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation: CLLocation = locations[0] as CLLocation
        
        let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        eventMap.setRegion(region, animated: true)
    }
    
    private func locationManager(manager: CLLocationManager, didFailWithError error: Error){
        print("Error \(error)")
    }
}
