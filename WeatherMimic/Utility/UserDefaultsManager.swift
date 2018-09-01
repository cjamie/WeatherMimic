//
//  UserDefaultsManager.swift
//  WeatherMimic
//
//  Created by Admin on 9/1/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

class UserDefaultsManager {
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
    
//    struct Keys {
//        static let affiliations = "ticketListing.affiliations"
//    }
//
//    static let defaults = UserDefaults.standard
//
//    static var affiliations: [String] {
//        get { return defaults.array(forKey: Keys.affiliations) as? [String] ?? [] }
//        set { defaults.set(newValue.filter { !$0.isBlank() }, forKey: Keys.affiliations) }
//    }
}


