//
//  WeatherMimicAdapter.swift
//  WeatherMimic
//
//  Created by Admin on 8/24/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

//will convert your WeatherForecast type into a WeatherPresentationDescribing type
//TODO: is this bad practice?
@available(*, unavailable, message: "Instead use WeatherMimicManager")
struct WeatherMimicAdapter {
    static let weatherForecastToWeatherPresentationModel: (WeatherForecast) -> WeatherPresentationModel = {
        WeatherPresentationModel(stateName: $0.city.name)
    }
}
