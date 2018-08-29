//
//  GenericBox.swift
//  WeatherMimic
//
//  Created by Admin on 8/27/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation


//this class will house a generic type, and execute an action whenever the value is set. (this is used for mvvm)
class Box<T> {
    typealias BoxClosure = (T) -> ()
    
    var closure: BoxClosure? //the closure we execute whenever the value has been changed
    
    var value: T { //the value we are observing
        didSet {
            closure?(value)
        }
    }

    func bind(closure: BoxClosure?) {
        self.closure = closure
        closure?(value)
    }
    
    init(_ value: T) {
        self.value = value
    }
}
