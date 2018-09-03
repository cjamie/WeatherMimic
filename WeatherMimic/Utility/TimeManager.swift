//
//  TimeManager.swift
//  WeatherMimic
//
//  Created by Admin on 9/1/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

typealias UnixTime = Int

//This takes in unit time (Int) and returns an appropriate date.
struct TimeManager {
    let dt: UnixTime
    
    //we can calculate a raw date as a result of unit time.
    var date: Date {
        let unixTime = Double(dt)
        return Date(timeIntervalSince1970: unixTime)
    }
    
    //TODO: add in useful string formats in here.
    
    
    
    
    
}
