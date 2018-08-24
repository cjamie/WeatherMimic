//
//  NetworkFacade.swift
//  WeatherMimic
//
//  Created by Admin on 8/21/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
import os.log

typealias ErrorJson = [String: Any]
typealias ResponseCode = Int

//responsible for getting an auth token, and then calling getWeather with the token
final class NetworkFacade {
    let authTokenFetcher: AuthTokenFetching
    let weatherFether: WeatherFetching
    
    init(authTokenFetcher: AuthTokenFetching = AuthTokenFetcher(), weatherFether: WeatherFetching = WeatherFetcher()){
        self.authTokenFetcher = authTokenFetcher
        self.weatherFether = weatherFether
    }
    
    func getWeatherData(completion: @escaping (FetchResult<WeatherForecast>) -> ()) {
        authTokenFetcher.getAuthToken {
            [weak self] token in
            self?.weatherFether.getWeather(with: token, completion: { completion($0) })
         }
    }
}
