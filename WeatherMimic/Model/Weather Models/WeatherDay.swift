//
//  WeatherDay.swift
//  WeatherMimic
//
//  Created by Admin on 8/22/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

/*
 dt         is your dateTime (unix time)(univeral time coordinated)
 main       is where you will get your weather ranges
 wind       is where you get your wind attributes
 wrather    is a group of descriptions 
 */

struct WeatherDay: Codable {
    var dt: Int
    var main: WeatherMain
    //    var clouds: Clouds
    //    var wind: Wind?
    var weather: [WeatherParts]
}
