//
//  WeatherData.swift
//  Weatherly
//
//  Created by Andas on 11.04.2023.
//

import Foundation

struct WeatherData {
    var temperature: Int
    var feelsLike: Int
    var tempMin: Int
    var tempMax: Int
    var description: String
    var name: String
    
    init?(weatherData: Weather) {
        temperature = weatherData.main.temp
        feelsLike = weatherData.main.feelsLike
        tempMin = weatherData.main.tempMin
        tempMax = weatherData.main.tempMax
        description = weatherData.weather.description
        name = weatherData.name
    }
}
