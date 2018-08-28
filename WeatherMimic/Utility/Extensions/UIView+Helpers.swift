//
//  UIView+Helpers.swift
//  WeatherMimic
//
//  Created by Admin on 8/22/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit


extension UIView {
    
    //MARK: anchoring helper function
    func anchor(top: NSLayoutYAxisAnchor? = nil, leading: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, trailing: NSLayoutXAxisAnchor? = nil, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
}


extension UIView {
    static func build(block: LabelBuilder) -> UILabel {
        let label = UILabel()
        block(label)
        return label
    }
    
    //TODO: verify if this works or not
    static func build2<T:UIView>(block: (T)->()) -> T{
        let placeholder = T()
        block(placeholder)
        return placeholder
    }
}

