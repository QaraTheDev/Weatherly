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
    
    override func loadView() {
        super.loadView()
        contentView.frame = view.bounds
        view.addSubview(contentView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CoreLocationController().getCoordinateFrom(city: "Seattle") { coordinate, error in
            print(coordinate)
        }
        networkController.fetchWeather()
    }
}
