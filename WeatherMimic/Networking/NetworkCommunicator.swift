//
//  NetworkCommunicator.swift
//  WeatherMimic
//
//  Created by Admin on 8/21/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
import os.log

//responsible for getting an auth token, and then calling getWeather with the token


//Concrete implementation of fetchers (will use the defaults)
//TODO: add all of the ~necessary~ implementations inside of extensions
final class NetworkCommunicator: WeatherFetching, AuthTokenFetching {
    
    
    //this will provide you with weather data
    func getWeatherData(completion: @escaping WeatherForecastHandler) {
        getAuthToken {
            [weak self] token in
            self?.getWeather(with: token, completion: { completion($0) })
        }
    }
}



