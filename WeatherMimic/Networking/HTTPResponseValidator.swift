//
//  HTTPResponseValidator.swift
//  WeatherMimic
//
//  Created by Admin on 8/23/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

enum FetchResult<T:Decodable>{
    case success(T) //this will a deserialized instance if successful
    case failure(Error) //this will return an error you may log
}

/*
 this struct's responsibility is to comb through the data and return a validation response
 
 this will check for the following NetworkError cases:
        .noResponse,
        .badResponseCode(let x),
        .errorResponse(let errorJson)
        .noData
        .jsonDecode error for intended type
        .deserializationError
 this will NOT check for the following NetworkError cases:
        .malformedURL
 
 the reason for this is that malformedURL gets handled before we reach here but this will handle everything else
 */

//T will be our type, and U will be the error json
struct HTTPResponseValidator<T: Decodable, U: Decodable & Error> {
    private let sessionTuple: (data: Data?, response: URLResponse?, error: Error?)

    init(sessionTuple: (data: Data?, response: URLResponse?, error: Error?)) {
        self.sessionTuple = sessionTuple
    }

    //this will return a Result based on
    var validationResult: FetchResult<T> {
        if let error = sessionTuple.error {
            return .failure(error)
        }
        
        guard let responseCode = (sessionTuple.response as? HTTPURLResponse)?.statusCode else {
            return .failure(NetworkErrors.noResponse)
        }
        
        guard (200..<300).contains(responseCode) else {
            return .failure(NetworkErrors.badResponseCode(responseCode))
        }

        guard let data = sessionTuple.data else {
            return .failure(NetworkErrors.noData)
        }

        let errorResponse: U? = validate(data: data) //this line became necessary because it is generic function
        if let validErrorResponse = errorResponse {
            print("valid error response?")
            return .failure(NetworkErrors.errorResponse(validErrorResponse))
        }
        
        let weatherForecast: T? = validate(data: data)
        guard let validWeatherForecast = weatherForecast else {
            print("serialization error for type: \(type(of: weatherForecast))")
            return .failure(NetworkErrors.deserializationError)
        }

        return .success(validWeatherForecast)
    }
    
    //MARK: Helper function
    
    private func validate<V: Decodable>(data: Data) -> V? {
        let temp = try? JSONDecoder().decode(V.self, from: data)
        return temp
    }
}
