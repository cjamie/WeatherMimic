//
//  UserDefaults+Helpers.swift
//  WeatherMimic
//
//  Created by Admin on 8/28/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

extension UserDefaults {
    var getWeatherUnit: WeatherUnit {
        let stringValue = string(forKey: UserDefaultKeys.weatherUnit)
        let unit = WeatherUnit(string: stringValue)
        return unit
    }
}
