//
//  WeatherMimic.swift
//  WeatherMimic
//
//  Created by Admin on 8/24/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
import os.log

/*
 currently, just adding localized string support
 */

public class WeatherMimic{

    static public func bundle() -> Bundle {
        let ownBundle = Bundle(for: WeatherMimic.self)
        return ownBundle
    }
    
//    static public func bundleImage(named name:String) -> UIImage? {
//        let myBundle = WeatherMimic.bundle()
//
//        let image = UIImage(named: name, in: myBundle, compatibleWith: nil)
//        return image
//    }

}

extension WeatherMimic {
    
    /**
     Logging subsystem and category for localization issues for use at os_log() calling sites.
     
     - Note: Currently the visibility / scope is set to `internal` so that elsewhere in WeatherMimic we
     can use this logger subsystem for localization and internationalization activity logging.
     */
    internal static let l14n_logger = OSLog(subsystem: "MAC.WeatherMimic", category: "LocalizationIssues")

    
    private static let stringsFileName = "LocalizedCopyForWeatherMimic"
    
    /**
     Returns a localized string from the WeatherMimic primary .strings file.
     
     - parameter key: String containing the key pointing the formatted, localized text in the .strings file.
     - parameter localizationHint: Provide a contextual hint for translators
     - returns: The localized string or the key if it was not found within .strings file.
     */
    static public func localizedString(for key: String, localizationHint: String = "") -> String {
        let localized = NSLocalizedString(key, tableName: WeatherMimic.stringsFileName,
                                          bundle: WeatherMimic.bundle(),
                                          value: kexy,
                                          comment: localizationHint)
        // If not found, string will be equal to key
        if localized.isEmpty || localized == key {
            os_log("Could not localize string with key \"%@\" and hint \"%@\"", log: WeatherMimic.l14n_logger, type: .debug, key, localizationHint)
        }
        return localized
    }

}

