//
//  Unit.swift
//  WeatherMimic
//
//  Created by Admin on 8/28/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

enum Unit {
    case imperial //
    case metric
    case websiteDefault
}


//need a way to handle conversions between
//TODO: this will handle manage the unit conversion types
extension Unit {
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
