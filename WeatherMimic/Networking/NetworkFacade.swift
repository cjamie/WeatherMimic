//
//  NetworkFacade.swift
//  WeatherMimic
//
//  Created by Admin on 8/21/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

typealias ErrorJson = [String: Any]
typealias ResponseCode = Int

enum NetworkErrors: Error{
    case malformedURL
    case badResponseCode(ResponseCode)
    case noData
    case noResponse
    case deserializationError //or invalidJSON
    case errorResponse(WeatherError)

}


//responsible for getting an auth token, and then calling getWeather with it.
final class NetworkFacade{
    let authTokenFetcher: AuthTokenFetching
    let weatherFether: WeatherFetching
    
    init(authTokenFetcher: AuthTokenFetching = AuthTokenFetcher(), weatherFether: WeatherFetching = WeatherFetcher()){
        self.authTokenFetcher = authTokenFetcher
        self.weatherFether = weatherFether
    }
    
    func getWeatherData(completion: @escaping (WeatherForecast?, Error?)-> ()){
     
        authTokenFetcher.getAuthToken {
            token in
            
            self.weatherFether.getWeather(with: token, completion: {
                forecast, error in
                
                if let error = error {
                    print(error.localizedDescription)
                    completion(nil, error)
                    return
                }
                
                guard let forecast = forecast else {
                    completion(nil, NetworkErrors.noData)
                    return
                }
                
            })
         }
    }
}
