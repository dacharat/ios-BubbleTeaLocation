//
//  ViewController.swift
//  BubbleTeaLocation
//
//  Created by Jack on 14/2/2562 BE.
//  Copyright © 2562 Jack. All rights reserved.
//

import Alamofire
import GoogleMaps
import UIKit

class ViewController: UIViewController {

    let locationManager = CLLocationManager()
    @IBOutlet weak var mapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        
        let marker = GMSMarker(position: CLLocationCoordinate2DMake(13.7597823, 100.5349915))

        marker.map = mapView
    }
    
    @IBAction func findAction(_ sender: Any) {
        Alamofire.request("https://api.foursquare.com/v2/venues/search?client_id=FXNO4CX1NPSWIBPD4UCUKZ4D0Y5E24PT2TZFNPV3LBV1VKZX&client_secret=YTGIDBAE4HODA0MS1VR1THKN5YEYINNCJ1DP225TNKY0E2DM&v=20180323&limit=10&ll=\(locationManager.location?.coordinate.latitude ?? 0.0),\(locationManager.location?.coordinate.longitude ?? 0.0)&query=bubbletea").responseJSON(completionHandler: {res in
            guard let json = res.result.value as? [String: Any] else {
                return
            }
            
            guard let response = json["response"] as? [String: Any] else {
                return
            }
            
            guard let venues = response["venues"] as? [[String: Any]] else {
                return
            }
            
            venues.forEach{venue in
                let place = Place(venue: venue)
                let marker = GMSMarker(position: place.location)
                marker.map = self.mapView
                marker.title = place.name
            }
        })
    }
    
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print(status.rawValue)
        if status == .authorizedWhenInUse {
            manager.startUpdatingLocation()
            
            mapView.isMyLocationEnabled = true
            mapView.settings.myLocationButton = true
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        
        print(location.coordinate.latitude)
        print(location.coordinate.longitude)
        
        mapView.camera = GMSCameraPosition(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude, zoom: 15)
    }
}
