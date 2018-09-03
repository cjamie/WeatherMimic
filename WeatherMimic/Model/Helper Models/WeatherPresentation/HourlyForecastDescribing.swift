//
//  HourlyForecastDescribing.swift
//  WeatherMimic
//
//  Created by Admin on 8/29/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

// this will power a collectionview
protocol HourlyForecastDescribing {
    var horizontalDataSource: [AccuWeatherUnit] { get }
    var numberOfHorizontalCells: Int {get}
}

extension HourlyForecastDescribing {
    var numberOfHorizontalCells: Int {
        return horizontalDataSource.count
    }
}

//this will decribe the tri-hourly time
protocol AccuWeatherUnit {
    var hourlyTime: String { get }
    var iconString: String { get }
    var degree: String { get }
}
