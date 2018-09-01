//
//  String+Height.swift
//  WeatherMimic
//
//  Created by Admin on 8/28/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

/*
 this will take in a label width, and font and calculate the height required
 */

extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedStringKey.font: font], context: nil)
        return ceil(boundingBox.height)
    }
}


//this is the same thing, but for attributed string (does not need a font parameter)

extension NSAttributedString {
    func height(withConstrainedWidth width: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil)
        return ceil(boundingBox.height)
    }
}
