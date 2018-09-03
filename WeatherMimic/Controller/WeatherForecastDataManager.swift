//
//  WeatherMimicManager.swift
//  WeatherMimic
//
//  Created by Admin on 8/26/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

//this will be responsible for adapting the model to suit the needs of different screens.

final class WeatherForecastDataManager {
    let forecast: WeatherForecast
    
    init(forecast: WeatherForecast) {
        self.forecast = forecast
    }
}

extension WeatherForecastDataManager: HeadlineDescribing {
    var cityName: String {
        return forecast.city.name
    }

    var weatherDescription: String {
        return forecast.list[0].weather[0].description.capitalized
    }
}

extension WeatherForecastDataManager: TemperatureDescribing {
    var temperature: String {
        let myTemp = String(forecast.list[0].main.temp)
        return String(format: WeatherMimic.localizedString(for: "com.WeatherMimic.WeatherPresentation.temperatureCelsius"), myTemp)
    }
    
    var weatherUnit: WeatherUnit {
        return UserDefaultsManager.weatherUnit
    }
}


extension WeatherForecastDataManager: DayInfoDescribing {
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

extension WeatherForecastDataManager: HourlyForecastDescribing {
    var horizontalDataSource: [AccuWeatherUnit] {
        return forecast.list // this model has been adapted to suit accuweatherunit
    }
    var horizontalDataSourceCount: Int {
        return horizontalDataSource.count
    }
    
    func getUnit(at indexPath: IndexPath)-> AccuWeatherUnit {
        return forecast.list[indexPath.row]
    }
    
}

//TODO: where does this belong?
extension WeatherDay: AccuWeatherUnit {
    var hourlyTime: String {
        return "\(TimeManager(dt: dt).date.string(forDateFormat: .hour))"
        
    }
    
    var iconString: String {
        return weather[0].icon
        
        
    }
    
    var degree: String {
        let degreeString = String(main.temp)
        return String(format: WeatherMimic.localizedString(for: "com.WeatherMimic.WeatherPresentation.temperatureCelsius"), degreeString)
    }
}


