//
//  ViewController.swift
//  WeatherMimic
//
//  Created by Admin on 8/21/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import os

typealias NetworkCallHandler = () -> ()

final class WeatherPresentationController: UIViewController {

    //should this be a protocol specifically suited for view controller?
    //note: we can use adapter pattern for this.
    
    var weatherForecast: WeatherPresentationDescribing?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.blue
        print("weather presentation controller ")
        
        networkCall()
    }
    
    lazy var networkCall: NetworkCallHandler = {
        NetworkCommunicator().getWeatherData {
            fetchResult in
            switch fetchResult{
            case .failure(let err):
                print(err.localizedDescription)
                os_log("error received in network communicator", log: .default, type: .debug)
            case .success(let forecastInstance):
                print(forecastInstance)
                //we want to adapt this instance into a weatherPresentationDescribing type
                self.weatherForecast = WeatherPresentationAdapter.convert(forecast: forecastInstance)
            }
        }
    }
    
    //populate your controller here.
    private var populateViewClosure: (WeatherPresentationDescribing) -> () = {
        let a = $0
        let temp = $0.stateName
    }
}

