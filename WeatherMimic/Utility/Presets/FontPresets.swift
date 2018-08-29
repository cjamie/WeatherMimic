//
//  FontPresets.swift
//  WeatherMimic
//
//  Created by Admin on 8/27/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

typealias NameSizeTuple = (name: String, size: CGFloat)

enum FontPresets {
    //headline cell
    static let headlineCity: NameSizeTuple = ("AvenirNext-DemiBold", 40)
    static let headlineDescription: NameSizeTuple = ("AvenirNext-Light", 24)

    //temperature cell
    static let temperatureLabel: NameSizeTuple = ("AvenirNext-Medium", 50)
    
    //dayInfo cell
    static let weekday: NameSizeTuple = ("AvenirNext-Medium", 28)
    static let todayText: NameSizeTuple = ("AvenirNext-Medium", 26)
    
    //general
    static let AvenirNextMedium26: NameSizeTuple = ("AvenirNext-Medium", 26)
}

//alternatively we can use an associated type enum that takes in an int
enum FontPreset2{
    case avenirNextMedium(CGFloat)
}

extension FontPreset2{
    var font: UIFont {
        switch self{
        case .avenirNextMedium(let x):
            return UIFont(name: "AvenirNext-Medium", size: x) ?? UIFont.systemFont(ofSize: x)
        }
    }
}

