//
//  WeatherParts.swift
//  WeatherMimic
//
//  Created by Admin on 8/22/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

/*
 id             is your weather condition id
 main           is a group of your weather parameters (Rain, Snow, Extreme, etc)
 description    is the weather condition within your group
 icon           is a query item to fetch a weather icon
 */

struct WeatherParts: Codable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}
