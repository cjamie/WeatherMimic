//
//  HourlyForecastDescribing.swift
//  WeatherMimic
//
//  Created by Admin on 8/29/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

// this will power a collectionview
protocol HourlyForecastDescribing {
    var hourlyDatasource: [TemperatureIncrement] { get }
    
}

struct TemperatureIncrement{
    
}
