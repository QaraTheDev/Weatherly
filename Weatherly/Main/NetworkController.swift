//
//  NetworkController.swift
//  Weatherly
//
//  Created by Andas on 09.04.2023.
//

import Foundation

struct NetworkController {
    
    let apiKey = "2354107261c79becda7833e8942d757e"

    func fetchWeather(latitude: Double, longitude: Double, completionHandler: @escaping (WeatherData) -> Void) {
        let urlBase = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)"
        guard let url = URL(string: urlBase) else { return }
        
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            if let weather = self.parseJSON(withData: data) {
                print(weather)
//               completionHandler(weather)
            }
        }
        
        task.resume()
    }
    
    func parseJSON(withData data: Data) -> WeatherData? {
        let decoder = JSONDecoder()
        do {
            
            let weatherData = try decoder.decode(Weather.self, from: data)
            guard let weather = WeatherData(weatherData: weatherData) else {
                return nil
                
            }
            
            return weather
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        return nil
    }
}
