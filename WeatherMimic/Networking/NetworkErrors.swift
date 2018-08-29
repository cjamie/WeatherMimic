//
//  NetworkErrors.swift
//  WeatherMimic
//
//  Created by Admin on 8/24/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

typealias ResponseCode = Int

enum NetworkErrors: Error {
    case malformedURL
    case badResponseCode(ResponseCode)
    case noData
    case noResponse
    case deserializationError //or invalidJSON
    case errorResponse(Error & Decodable)
}

extension NetworkErrors: LocalizedError {
    public var errorDescription: String? {
        let descriptionString: String
        
        switch self {
        case .malformedURL:
            descriptionString = NSLocalizedString("A user-friendly description of the error.", comment: "My error")
        case .badResponseCode(let x):
            descriptionString = NSLocalizedString("Response code was out of range", comment: "badResponseCode:\(x)")
        case .noData:
            descriptionString = NSLocalizedString("payload was empty", comment: "noData")
        case .noResponse:
            descriptionString = NSLocalizedString("No response", comment: "noResponse")
        case .deserializationError:
            descriptionString = NSLocalizedString("error trying to decode json", comment: "deserializationError")
        case .errorResponse(let x):
            descriptionString = NSLocalizedString("Server responded with an error json", comment: "errorResponse:\(x)")
        }
        return descriptionString
    }
}
