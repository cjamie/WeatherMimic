//
//  TimeManager.swift
//  WeatherMimic
//
//  Created by Admin on 9/1/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

typealias UnixTime = Int

struct TimeManager {
    let dt: UnixTime
    
    var date: Date {
        let unixTime = Double(dt)
        return Date(timeIntervalSince1970: unixTime)
    }
    
}
