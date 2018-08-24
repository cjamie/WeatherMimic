//
//  WeatherPresentationAdapter.swift
//  WeatherMimic
//
//  Created by Admin on 8/24/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

//this will convert your forceast into a WeatherPresentationDescribing type
struct WeatherPresentationAdapter{
    static func convert(forecast: WeatherForecast)->WeatherPresentationModel{
        return WeatherPresentationModel(stateName: forecast.city.name)
    }
}
