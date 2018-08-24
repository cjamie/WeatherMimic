//
//  WeatherMain.swift
//  WeatherMimic
//
//  Created by Admin on 8/22/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

/*
 Group of weather parameters (Rain, Snow, Extreme etc.)
 temp is your temperature (in your chosen format, it is Kelvin by default)
 temp_min is your lowest projected temp ~Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.~
 temp_max is your highest projected temp
 humidity is your Humidity(%)
 pressure is pressure (hpa)
 */

struct WeatherMain: Codable{
    var temp: Double
    var temp_min: Double
    var temp_max: Double
    var humidity: Int
    var pressure: Double
}
