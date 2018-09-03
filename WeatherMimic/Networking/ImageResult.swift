//
//  ImageResult.swift
//  WeatherMimic
//
//  Created by Admin on 9/1/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

enum ImageResult {
    case success(UIImage)
    case failure(Error)
}

struct HTTPImageResponseValidator{
    private let validResponseCodes = (200..<300)
    private let sessionTuple: (data: Data?, response: URLResponse?, error: Error?)
    private let decoder = JSONDecoder()
    
    init(sessionTuple: (data: Data?, response: URLResponse?, error: Error?)) {
        self.sessionTuple = sessionTuple
    }
    
    //this will return a Result based on
    var validationResult: ImageResult {
        if let error = sessionTuple.error {
            return .failure(error)
        }
        
        guard let responseCode = (sessionTuple.response as? HTTPURLResponse)?.statusCode else {
            return .failure(NetworkErrors.noResponse)
        }
        
        guard validResponseCodes.contains(responseCode) else {
            return .failure(NetworkErrors.badResponseCode(responseCode))
        }
        
        guard let data = sessionTuple.data else {
            return .failure(NetworkErrors.noData)
        }
        
        if let validErrorResponse = try? decoder.decode(WeatherError.self, from: data) {
            return .failure(NetworkErrors.errorResponse(validErrorResponse))
        }
        
        guard let validImage = UIImage(data: data) else {
            return .failure(NetworkErrors.badImage)
        }
        return .success(validImage)
    }
}
