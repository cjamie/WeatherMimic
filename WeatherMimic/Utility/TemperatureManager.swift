//
//  TemperatureManager.swift
//  WeatherMimic
//
//  Created by Admin on 8/25/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

typealias Kelvin = Double
private typealias UnitConversionClosure = (Double) -> (Double)

//TODO: make some unit tests for this
struct TemperatureManager {
    //the temperature is stored internally as a Kelvin
    private let tempKelvin: Kelvin
    
    //Conversion Constants
    private enum Constants{
        static let kelvinZero = 273.15
        static let fahrenHeitModifier: Double = 9/5
        static let fahrenheitToKelvinConstant = 459.67
        static let fahrenheitToKelvinModifier: Double = 5/9
    }
    
    //Constructors
    init(kelvin: Kelvin){
        self.tempKelvin = kelvin
    }
    
    //T(K) = T(°C) + 273.15
    init(celsius: Double){
        let celsiusToKelvin: UnitConversionClosure = { $0 + Constants.kelvinZero }
        let kelvin = celsiusToKelvin(celsius)
        
        self.init(kelvin: kelvin)
    }
    
    //T(K) = (T(°F) + 459.67)× 5/9
    init(fahrenheit: Double) {
        let fahrenheitToKelvin: UnitConversionClosure = { ($0 + Constants.fahrenheitToKelvinConstant) * Constants.fahrenheitToKelvinModifier }
        let kelvin = fahrenheitToKelvin(fahrenheit)
        
        self.init(kelvin: kelvin)
    }
}

//Utility functions
extension TemperatureManager {
    // K = K
    var asKelvin: Double {
        return tempKelvin
    }
    
    //°C = K - 273.15
    var asCelcius: Double {
        return tempKelvin - Constants.kelvinZero
    }
    
    //T(°F) = T(K) × 9/5 - 459.67
    var asFahrenheit: Double {
        return (tempKelvin * Constants.fahrenHeitModifier) - Constants.fahrenheitToKelvinConstant
    }
}

