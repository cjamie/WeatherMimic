//
//  UIFont+Custom.swift
//  WeatherMimic
//
//  Created by Admin on 8/25/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

private typealias NameSizeTuple = (name: String, size: CGFloat)

private enum FontComponents {
    case headlineCity
    case headlineDescription
}

extension FontComponents {
    var value: NameSizeTuple {
        switch self {
        case .headlineCity:
            return ("AvenirNext-Medium", 20)
        case .headlineDescription:
            return ("AvenirNext-Medium", 16)
        }
    }
}

extension UIFont {
    
    static let weatherMimicHeadlineCity: UIFont = UIFont(withNameSize: .headlineCity) ?? UIFont()
    static let weatherMimicHeadlineDescription: UIFont = UIFont(withNameSize: .headlineDescription) ?? UIFont()
    
    private convenience init?(withNameSize tuple: FontComponents) {
        self.init(name: tuple.value.name, size: tuple.value.size)
    }
}
