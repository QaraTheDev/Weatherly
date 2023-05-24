//
//  CoreLocationController.swift
//  Weatherly
//
//  Created by Andas on 12.04.2023.
//

import Foundation
import CoreLocation

let networkControllerManager = NetworkController()

struct CoreLocationController {
        
    func getCitiesWeather(citiesArray: [String], completionHandler: @escaping (Int, WeatherData) -> Void){
        for (index, item) in citiesArray.enumerated() {
            getCoordinateFrom(city: item) { coordinate, error in
                guard let coordinate = coordinate, error == nil else { return }
                
                networkControllerManager.fetchWeather(latitude: coordinate.latitude, longitude: coordinate.longitude) { weather in
                    completionHandler(index, weather)
                }
            }
        }
    }
    
    func getCoordinateFrom(city: String, completion: @escaping(_ coordinate: CLLocationCoordinate2D?, _ error: Error?) -> () ) {
        CLGeocoder().geocodeAddressString(city) { placemark, error in
            completion(placemark?.first?.location?.coordinate, error)
        }
    }
}
