//
//  Date+Helpers.swift
//  WeatherMimic
//
//  Created by Admin on 8/29/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

enum DateFormat: String {
    case weekdayMonthDayYear = "EEEE, MMMM dd, yyyy"
    case weekDay = "EEEE"
}

extension Date {
    func string(forDateFormat dateFormat: DateFormat) -> String {
        //TODO: is there a way to improve this so I don't need to instantiate a formatter each time.
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat.rawValue
        return formatter.string(from: self)
    }
}
