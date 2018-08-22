//
//  WeatherFetcher.swift
//  WeatherMimic
//
//  Created by Admin on 8/21/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

//will make a weather call.
//will fetch an auth token, after it receive auth token, it will make a call with your preferences.

protocol WeatherFetching{
    func getWeather()
}

class WeatherFetcher: WeatherFetching{
        
    func getWeather(){
        print("code to get weather here")
    }
}

