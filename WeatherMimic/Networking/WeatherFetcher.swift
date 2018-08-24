//
//  WeatherFetcher.swift
//  WeatherMimic
//
//  Created by Admin on 8/21/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

//this will be called after obtaining an auth token
//will fetch an auth token, after it receive auth token, it will make a call with your preferences.

typealias AuthToken = String

protocol WeatherFetching{
    func getWeather(with: AuthToken, completion: @escaping (FetchResult<WeatherForecast>) -> ())
}

//this will bubble up the responsibiltiy of providing a closure to the caller
final class WeatherFetcher: WeatherFetching{
    
    func getWeather(with: AuthToken, completion: @escaping (FetchResult<WeatherForecast>) -> ()) {
        //calls request factory to create a request
        //TODO: experiment with core data.
        
        let dependencies = URLConstructibleConcrete(host: NetworkConstants.Weather.host,
                                                    scheme: NetworkConstants.Weather.scheme,
                                                    path: NetworkConstants.Weather.path,
                                                    items: NetworkConstants.Weather.defaultItems)
        
        guard let weatherRequest = RequestFactory.shared.makeWeatherRequest(urlParts: dependencies) else {
            //failure to make a proper url
            return
        }

        let session = URLSession.shared
        session.invalidateAndCancel()
        
        session.dataTask(with: weatherRequest) {
           (data, response, error) in
            let tuple = (data, response, error)
            let result = HTTPResponseValidator<WeatherForecast, WeatherError>(sessionTuple: tuple).validationResult
            completion(result)
        }.resume()
    }
}

