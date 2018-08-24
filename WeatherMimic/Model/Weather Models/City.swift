//
//  City.swift
//  WeatherMimic
//
//  Created by Admin on 8/22/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

/*
 id         is your city id based on
 name       is you city's name
 country    is your city's country
 coord      is your city's coordinate
 */

struct City: Codable {
    var id: Int
    var name: String
    var country: String
    var coord: Coordinate
}
