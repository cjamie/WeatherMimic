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
final class NetworkCommunicator: WeatherFetching, AuthTokenFetching {
    //the payload will get bubbled up to the caller, who will finally handle it.
    func getWeatherData(completion: @escaping WeatherForecastHandler) {
        getAuthToken {
            [weak self] token in
            self?.getWeatherData(completion: completion)
        }
    }
}



