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
    
    var weatherForecast: WeatherPresentationDescribing?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.blue
        print("weather controller")
        NetworkFacade().getWeatherData {
            (forecast, error) in
            
        }
        
    }
}

