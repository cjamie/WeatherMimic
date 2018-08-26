//
//  UIFont+Custom.swift
//  WeatherMimic
//
//  Created by Admin on 8/25/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

typealias NameSizeTuple = (name: String, size: CGFloat)

extension UIFont {
    private static let avenirNext = "AvenirNext-Medium"
    
    static func from(nameSize tuple: NameSizeTuple) -> UIFont {
        return UIFont(name: tuple.name, size: tuple.size) ?? UIFont.systemFont(ofSize: tuple.size)
    }
}

enum FontPresets {
    static let headlineCity:NameSizeTuple = ("AvenirNext-Medium", 20)
    static let headlineDescription:NameSizeTuple = ("AvenirNext-Medium", 16)
}
