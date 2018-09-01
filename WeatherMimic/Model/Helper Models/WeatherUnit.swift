//
//  WeatherUnit.swift
//  WeatherMimic
//
//  Created by Admin on 8/28/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

enum WeatherUnit {
    case imperial //
    case metric
    case websiteDefault
}

extension WeatherUnit{
    init(string: String?) {

        //TODO: find a way to handle this more elegantly.
        if let _ = string {
            self = .websiteDefault
        }
        
        switch string {
        case "imperial":
            self = .imperial
        case "metric":
            self = .metric
        default:
            self = .websiteDefault
        }
    }
}


//need a way to handle conversions between
//TODO: this will handle manage the unit conversion types
extension WeatherUnit {
    //Wind
    var windType: String {
        switch self {
        case .imperial:
            return "miles/hour"
        case .metric:
            return "meter/sec"
        case .websiteDefault:
            return "meter/sec,"
        }
    }
}
