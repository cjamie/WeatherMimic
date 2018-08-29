//
//  UserDefaults+Helpers.swift
//  WeatherMimic
//
//  Created by Admin on 8/28/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

extension UserDefaults {
    private enum Constants{
        static let weatherUnit = "weatherUnit"
    }
    
    static var getWeatherUnit: WeatherUnit {
        let stringValue = standard.string(forKey: Constants.weatherUnit) ?? ""
        let unit =  WeatherUnit(string: stringValue)
        return unit
    }
}
