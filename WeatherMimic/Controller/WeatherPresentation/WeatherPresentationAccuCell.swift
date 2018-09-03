//
//  WeatherPresentationAccuCell.swift
//  WeatherMimic
//
//  Created by Admin on 9/1/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import os.log
//TODO: this cell needs a view model.

final class WeatherPresentationAccuCell: UICollectionViewCell {
    
    static let reuseIdentifier = "WeatherPresentationAccuCell"

    var boxedManager: Box<AccuWeatherUnit?> = Box(nil) {
        didSet {
            guard let value = boxedManager.value else {return}
            print("accuweather cell set with a value \(value)")
            boxedManager.bind {
                [weak self] unit in //Question: is this weak self necessary here?
                guard let strongSelf = self else {
                    os_log("accucell self is nil")
                    return
                }
                guard let unitAdapted: AccuWeatherUnit = unit else {
                    return
                }
                strongSelf.triHourlyLabel.text = "\(unitAdapted.hourlyTime)"

//                strongSelf.triHourlyLabel.text = "\(unitAdapted?.hourlyTime)"
//                strongSelf.tempLabel.text = "\(unitAdapted?.degree)"
                //TODO: add in the weather icon.
            }
        }
    }

    
    
    private let triHourlyLabel: UILabel = {
        UILabel.build(block: ViewPresets.triHourlyLabelModifier)
    }()
    
    private let tempLabel: UILabel = {
        UIView.build(block: ViewPresets.smallTemperatureLabelModifier)
    }()

    private let imageView: UIImageView = {
        UIView.build(block: ViewPresets.iconViewModifier)
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("printing subviews0 \(subviews.count)")

        [triHourlyLabel, tempLabel, imageView].forEach( addSubview )

        print("printing subviews \(subviews.count)")
        backgroundColor = UIColor.red
        
        
        //anchoring logic
        triHourlyLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 16))
        
        imageView.anchor(top: triHourlyLabel.bottomAnchor, leading: triHourlyLabel.leadingAnchor, bottom: nil, trailing: triHourlyLabel.trailingAnchor, padding: .zero, size: .init(width: 0, height: frame.width))
        tempLabel.anchor(top: imageView.bottomAnchor, leading: triHourlyLabel.leadingAnchor, bottom: bottomAnchor, trailing: triHourlyLabel.trailingAnchor)
        tempLabel.setContentHuggingPriority(.init(rawValue: 252), for: .vertical)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
