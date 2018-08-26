//
//  WeatherFetcher.swift
//  WeatherMimic
//
//  Created by Admin on 8/21/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
import os.log
//this will be called after obtaining an auth token

typealias AuthToken = String

//this is a call where we specifically use WeatherForecast as the generic type
protocol WeatherFetching: class, Fetcher {
    func getWeather(with: AuthToken, completion: @escaping (FetchResult<WeatherForecast>) -> ())
}

//it will have default functionality

extension WeatherFetching {
    
    //we can specify our fetch session her
    var fetchSession: URLSession {
        return URLSession(configuration: .ephemeral)
    }
    
    var dependencies: URLConstructible {
        return URLConstructibleConcrete(host: NetworkConstants.Weather.host,
                                        scheme: NetworkConstants.Weather.scheme,
                                        path: NetworkConstants.Weather.path,
                                        items: NetworkConstants.Weather.defaultItems)
    }
    
    func getWeather(with: AuthToken, completion: @escaping (FetchResult<WeatherForecast>) -> ()) {
        //TODO: experiment with core data.
        //we should have a default url already because we conform to Fetching
        print("using default implementatino of WeatherFetching")
        
        guard let weatherRequest = RequestFactory.shared.makeWeatherRequest(url: url) else {
            //failure to make a proper url
            return
        }

        fetchSession.invalidateAndCancel()
    
        let handler: (Data?, URLResponse?, Error?) -> () = {
            let tuple = ($0, $1, $2)
            let result = HTTPResponseValidator<WeatherForecast, WeatherError>(sessionTuple: tuple).validationResult
            completion(result)
        }
        fetchSession.dataTask(with: weatherRequest, completionHandler: handler).resume()
    }

}



//this will bubble up the responsibiltiy of providing a closure to the caller
final class WeatherFetcher: WeatherFetching {
    
}






