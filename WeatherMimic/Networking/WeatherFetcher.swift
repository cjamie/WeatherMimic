//
//  WeatherFetcher.swift
//  WeatherMimic
//
//  Created by Admin on 8/21/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

//will make a weather call.
//will fetch an auth token, after it receive auth token, it will make a call with your preferences.

typealias AuthToken = String

protocol WeatherFetching{
    func getWeather(with: AuthToken, completion: @escaping (WeatherForecast?, Error?)->())
}

final class WeatherFetcher: WeatherFetching{
    
    func getWeather(with: AuthToken, completion: @escaping (WeatherForecast?, Error?) -> ()) {
    //calls request factory to create a request
        //todo: experiment with core data.
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
            [weak self] (data, response, error) in
            
            let tuple = (data, response, error)
            let result = HTTPResponseValidator<WeatherForecast, WeatherError>(sessionTuple: tuple).validationResult

            switch result{
            case .failure(let myError): //we can pattern match to the error or data
                completion(nil, myError)
                return
            case .success(let codable):
                completion(codable, nil)
                return
            }
        }
    }
}

