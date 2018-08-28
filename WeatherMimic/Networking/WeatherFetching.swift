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
protocol WeatherFetching: Fetcher {
    var weatherRequest: URLRequest { get }
    func getWeather(with: AuthToken, completion: @escaping WeatherForecastHandler)
    func getWeather(completion: @escaping WeatherForecastHandler)
}

//it will have default functionality
extension WeatherFetching {
    
    //overriding the pre-exisiting session of .shared to ephemeral configuration
    var fetchSession: URLSession {
        //ephemeral session configuration uses no persistent storage (for cache, cookies, credentials)
        return URLSession(configuration: .ephemeral)
    }
    
    var weatherRequest: URLRequest {
        return RequestFactory.shared.makeWeatherRequest(url: url)
    }
    
    func getWeather(with authToken: AuthToken, completion: @escaping WeatherForecastHandler) {
        fetchSession.invalidateAndCancel()
        
        //this will account for the auth token.
//        weatherRequest.addValue(authToken, forHTTPHeaderField: "")

        let handler: (Data?, URLResponse?, Error?) -> () = {
            let tuple = ($0, $1, $2)
            let result = HTTPResponseValidator<WeatherForecast, WeatherError>(sessionTuple: tuple).validationResult
            completion(result)
        }
        
        fetchSession.dataTask(with: weatherRequest, completionHandler: handler).resume()
    }
    
    func getWeather(completion: @escaping WeatherForecastHandler) {
        //TODO: specify the preferences first
        fetchSession.invalidateAndCancel()
        
        let handler: (Data?, URLResponse?, Error?) -> () = {
            let tuple = ($0, $1, $2)
            let result = HTTPResponseValidator<WeatherForecast, WeatherError>(sessionTuple: tuple).validationResult
            completion(result)
        }
        
        fetchSession.dataTask(with: weatherRequest, completionHandler: handler).resume()
    }

    
    
}

