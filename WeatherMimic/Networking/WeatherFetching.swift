//
//  WeatherFetching.swift
//  WeatherMimic
//
//  Created by Admin on 8/21/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
import os.log
//this will be called after obtaining an auth token

typealias AuthToken = String
typealias WeatherForecastHandler = (FetchResult<WeatherForecast>) -> ()

//this is a call where we specifically use WeatherForecast as the generic type
protocol WeatherFetching: class, Fetcher {
    var weatherRequest: URLRequest { get }
    func getWeather(with: AuthToken, completion: @escaping WeatherForecastHandler)
}

//it will have default functionality

extension WeatherFetching {
    
    //we can specify our fetch session here
    var fetchSession: URLSession {
        return URLSession(configuration: .ephemeral)
    }
    
    var weatherRequest: URLRequest {
        return RequestFactory.shared.makeWeatherRequest(url: url)
    }
    
    func getWeather(with: AuthToken, completion: @escaping WeatherForecastHandler) {
        //TODO: experiment with core data.
        fetchSession.invalidateAndCancel()
        let handler: (Data?, URLResponse?, Error?) -> () = {
            let tuple = ($0, $1, $2)
            let result = HTTPResponseValidator<WeatherForecast, WeatherError>(sessionTuple: tuple).validationResult
            completion(result)
        }
        
        fetchSession.dataTask(with: weatherRequest, completionHandler: handler).resume()
    }
}








