//
//  HTTPResponseValidator.swift
//  WeatherMimic
//
//  Created by Admin on 8/23/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

enum FetchResult{
    case success(Data) //this will return json Data to parse/deserialize.
    case failure(Error) //this will return an error you may log
}

/*
 this struct's responsibility is to comb through the data and return a validation response
 this will
    check for the following NetworkError cases:
        .noResponse,
        .badResponseCode(let x),
        .errorResponse(let errorJson)
        .noData
 
 this will not:
        .malformedURL
        .
 
 */


struct HTTPResponseValidator {
    //this will
    private let sessionTuple: (data: Data?, response: URLResponse?, error: Error?)

    init(sessionTuple: (data: Data?, response: URLResponse?, error: Error?) ){
        self.sessionTuple = sessionTuple
    }

    //this will return a Result based on
    var validationResult: FetchResult {
        if let error = sessionTuple.error {
            return .failure(error)
        }
        
        guard let responseCode  = (sessionTuple.response as? HTTPURLResponse)?.statusCode else {
            return .failure(NetworkErrors.noResponse)
        }
        
        guard (200..<300).contains(responseCode) else {
            return .failure(NetworkErrors.badResponseCode(responseCode))
        }

        guard let data = sessionTuple.data else {
            return .failure(NetworkErrors.noData)
        }
        
        
        return validate(data: data) ?? .success(data)
    }
    
    // TODO: verify different configurations for this json
    // cms may return a json that is interpretted as an error json
    // this function
    private func validate(data asErrorJson: Data) -> FetchResult?{
        guard let weatherError = try? JSONDecoder().decode(WeatherError.self, from: asErrorJson) else { return nil }
        return .failure(NetworkErrors.errorResponse(weatherError))
    }
    
}
