//
//  TemperatureManager.swift
//  WeatherMimic
//
//  Created by Admin on 8/25/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

typealias Kelvin = Double

//TODO: make some unit tests for this
struct TemperatureManager{
    //will store the temperature internally as a Kelvin
    let temperature: Kelvin
    
    private enum Constants{
        static let kelvinZero = 273.15
        static let fahrenHeitModifier: Double = 9/5
        static let fahrenheitToKelvinConstant = 459.67
        static let fahrenheitToKelvinModifier: Double = 5/9

    }
    
    //init
    
    init(kelvin: Kelvin){
        self.temperature = kelvin
    }
    
    init(celsius: Double){
        let celsiusToKelvin: (Double) -> Kelvin = { $0 + Constants.kelvinZero }
        let kelvin = celsiusToKelvin(celsius)
        
        self.init(kelvin: kelvin)
    }
    
    init(fahrenheit: Double) {
        let fahrenheitToKelvin: (Double) -> Kelvin = { ($0 + Constants.fahrenheitToKelvinConstant) * Constants.fahrenheitToKelvinModifier }
        let kelvin = fahrenheitToKelvin(fahrenheit)
        
        self.init(kelvin: kelvin)
    }
}

extension TemperatureManager {
    
    var asKelvin: Double {
        return temperature
    }
    
    var asCelcius: Double {
        return temperature - Constants.kelvinZero
    }
    
//    T(°F) = T(K) × 9/5 - 459.67
    var asFahrenheit: Double {
        return (temperature * Constants.fahrenHeitModifier) - Constants.fahrenheitToKelvinModifier
    }
}

