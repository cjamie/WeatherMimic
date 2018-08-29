//
//  TemperatureDescribing.swift
//  WeatherMimic
//
//  Created by Admin on 8/28/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

protocol TemperatureDescribing {
    var temperature: String { get }
    var weatherUnit: WeatherUnit { get }
}
