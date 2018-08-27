//
//  WeatherMimicManager.swift
//  WeatherMimic
//
//  Created by Admin on 8/26/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

//this will be responsible for adapting the model to suit the needs of different screens.

final class WeatherMimicManager {
    let forecast: WeatherForecast
    
    init(forecast: WeatherForecast){
        self.forecast = forecast
    }
}

extension WeatherMimicManager: WeatherPresentationDescribing {
    var stateName: String {
        return forecast.city.name
    }
}

extension WeatherMimicManager: HeadlineDescribing {
    var cityName: String {
        return forecast.city.name
    }

    var weatherDescription: String {
        return forecast.list[0].weather[0].description
    }
}

extension WeatherMimicManager {
    
}


