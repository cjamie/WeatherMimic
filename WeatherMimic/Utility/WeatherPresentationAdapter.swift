//
//  WeatherPresentationAdapter.swift
//  WeatherMimic
//
//  Created by Admin on 8/24/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

//this will convert your WeatherForecast type into a WeatherPresentationDescribing type
enum WeatherPresentationAdapter {
    
    static let convertForecastToWeatherPresentationModel: (WeatherForecast) -> (WeatherPresentationModel) = {
        forecast in
        return WeatherPresentationModel(stateName: forecast.city.name)
    }
    
    static func convert(forecast: WeatherForecast) -> WeatherPresentationModel {
        return WeatherPresentationModel(stateName: forecast.city.name)
    }
}
