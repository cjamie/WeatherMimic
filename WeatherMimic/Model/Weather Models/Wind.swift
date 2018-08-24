//
//  Wind.swift
//  WeatherMimic
//
//  Created by Admin on 8/22/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

/*
 speed is your Wind speed. Unit Default: meter/sec, Metric: meter/sec, Imperial: miles/hour.
 def is your  direction (degree)
 */

struct Wind: Codable {
    var speed: Double
    var deg: Double
}
