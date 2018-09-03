//
//  UserDefaultsManager.swift
//  WeatherMimic
//
//  Created by Admin on 9/1/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

enum UserDefaultKeys {
    static let weatherUnit = "weatherUnit"
}

final class UserDefaultsManager {
    static let defaults = UserDefaults.standard
    
    static var weatherUnit: WeatherUnit {
        get {
            let stringValue = defaults.string(forKey: UserDefaultKeys.weatherUnit)
            return WeatherUnit(string: stringValue)
        }
        set {
            defaults.set(newValue, forKey: UserDefaultKeys.weatherUnit)
        }
    }
}


