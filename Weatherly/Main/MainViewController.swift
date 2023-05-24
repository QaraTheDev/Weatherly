//
//  MainViewController.swift
//  Weatherly
//
//  Created by Andas on 31.03.2023.
//

import SnapKit
import UIKit

class MainViewController: UIViewController {
    let contentView = MainView()
    let networkController = NetworkController()
    let coreLocationController = CoreLocationController()
    
    var fetchedData: WeatherData?
    let nameCitiesArray = ["Nur-Sultan","Almaty","Frankfurt-am-Main","Seattle","Miami"]
    
    override func loadView() {
        super.loadView()
        contentView.frame = view.bounds
        view.addSubview(contentView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coreLocationController.getCitiesWeather(citiesArray: nameCitiesArray) { index, weatherData in
            self.fetchedData = weatherData
        }
    }
}
