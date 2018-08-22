//
//  NetworkFacade.swift
//  WeatherMimic
//
//  Created by Admin on 8/21/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

//will just call 
final class NetworkFacade{
    var weatherFether: WeatherFetching?
    
    func getWeatherDate(){
        weatherFether?.getWeather()
    }
}
