//
//  LocationManager.swift
//  OpeningPage
//
//  Created by Chen Jin on 7/10/22.
//

import Foundation
import CoreLocation

//after : are the protocols that we are confirming
class LocationManager: NSObject,ObservableObject, CLLocationManagerDelegate{
    //create a new instance of CLLocationManager
    let manager = CLLocationManager();
    //? means optional - user might not supply a location coord
    @Published var location : CLLocationCoordinate2D?;
    @Published var isLoading = false;
    
    override init(){
        super.init()
        manager.delegate = self;
    }
    
    func requestLocation(){
        isLoading = true;
        manager.requestLocation();
    }
    
    //locations is an array of CLLocation
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate;
        isLoading = false;
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location", error);
        isLoading = false;
    }
}
