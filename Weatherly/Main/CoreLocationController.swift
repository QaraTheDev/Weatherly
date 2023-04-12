//
//  CoreLocationController.swift
//  Weatherly
//
//  Created by Andas on 12.04.2023.
//

import Foundation
import CoreLocation

struct CoreLocationController {
    let citiesArray = ["Nur-Sultan","Almaty","Frankfurt-am-Main","Seattle","Miami"]
    
    func getCoordinateFrom(city: String, completion: @escaping(_ coordinate: CLLocationCoordinate2D?, _ error: Error?) -> () ) {
        CLGeocoder().geocodeAddressString(city) { placemark, error in
            completion(placemark?.first?.location?.coordinate, error)
        }
    }
}
