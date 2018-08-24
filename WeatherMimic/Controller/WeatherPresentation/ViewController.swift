//
//  ViewController.swift
//  WeatherMimic
//
//  Created by Admin on 8/21/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    //should this be a protocol specifically suited for view controller?
    //note: we can use adapter pattern for this.
    
    var weatherForecast: WeatherPresentationDescribing?{
        didSet{
            guard let weatherForecast = weatherForecast else { return }
            print("weather forecast here \(weatherForecast)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.blue
        print("weather controller")
        
        networkCall()
    }
    
    lazy var networkCall: ()->() = {
        NetworkFacade().getWeatherData {
            fetchResult in
            switch fetchResult{
            case .failure(let err):
                print(err.localizedDescription)
            case .success(let forecastInstance):
                print(forecastInstance)
                //we want to adapt this instance into a weatherPresentationDescribing type
                self.weatherForecast = WeatherPresentationAdapter.convert(forecast: forecastInstance)
            }
        }
    }
    
    private var populateViewClosure: (WeatherPresentationDescribing) -> () = {
        let a = $0
        let temp = $0.stateName
    }
    
    
    
    
}

