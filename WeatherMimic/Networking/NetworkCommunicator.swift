//
//  NetworkCommunicator.swift
//  WeatherMimic
//
//  Created by Admin on 8/21/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
import os.log

typealias ResponseCode = Int

//responsible for getting an auth token, and then calling getWeather with the token


//Concret
//TODO: add all of the ~necessary~ implementations inside of extensions
final class NetworkCommunicator: WeatherFetching {
    let authTokenFetcher: AuthTokenFetching
    
    init(authTokenFetcher: AuthTokenFetching) {
        self.authTokenFetcher = authTokenFetcher
        
    }

    func getWeatherData(completion: @escaping (FetchResult<WeatherForecast>) -> ()) {
        authTokenFetcher.getAuthToken {
            [weak self] token in
            self?.getWeather(with: token, completion: { completion($0) })

         }
    }
}

extension NetworkCommunicator{
    convenience init() {
        self.init(authTokenFetcher: AuthTokenFetcher())
    }
}

