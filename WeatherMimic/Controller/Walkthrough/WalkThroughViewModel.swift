//
//  WalkThroughViewModel.swift
//  WeatherMimic
//
//  Created by Admin on 8/21/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

protocol WalkThroughViewModelProtocol{
    
}

class WalkThroughViewModel: WalkThroughViewModelProtocol{
//    weak var delegate: WalkthroughController
    
    //TODO: make this weak with a protocol. 
    var delegate: WalkthroughController?

    init(){
        
    }
}
