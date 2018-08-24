//
//  WeatherForecast.swift
//  WeatherMimic
//
//  Created by Admin on 8/22/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

/*
 cnt is number of days returned by api call
 list is your list of Weather days
 city is your city
 cod is your http response code in the json
 */

struct WeatherForecast: Codable{
    var cnt: Int
    var list: [WeatherDay]
    var city: City
//    var cod: String
    var cod: String

}



