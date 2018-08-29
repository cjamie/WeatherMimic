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
    
    init(forecast: WeatherForecast) {
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
        return forecast.list[0].weather[0].description.capitalized
    }
}

extension WeatherMimicManager: TemperatureDescribing {
    var temperature: String {
        let myTemp = String(forecast.list[0].main.temp)
        return String(format: WeatherMimic.localizedString(for: "com.WeatherMimic.WeatherPresentation.temperature"), myTemp)
    }
    
    var weatherUnit: WeatherUnit {
        //TODO: make this an extension.
        return UserDefaults.getWeatherUnit
    }
}


extension WeatherMimicManager: DayInfoDescribing {
    var weekDay: String {
        return Date().string(forDateFormat: .weekDay)
    }
    var highTemp: String {
        return String(forecast.list[0].main.temp_max)
    }
    var lowTemp: String {
        return String(forecast.list[0].main.temp_min)
    }
}

//extension WeatherMimic: HourlyForecastDescribing {
//}




