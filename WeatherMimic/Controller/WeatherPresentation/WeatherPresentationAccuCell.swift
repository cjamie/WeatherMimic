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
            boxedManager.bind(closure: populateLabels)
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
    
    private func setContentHuggingPriorities() {
        triHourlyLabel.setContentHuggingPriority(.init(rawValue: 253), for: .vertical)
        imageView.setContentHuggingPriority(.init(rawValue: 252), for: .vertical)
        tempLabel.setContentHuggingPriority(.init(rawValue: 251), for: .vertical)
    }
    
    fileprivate func anchorSubviews() {
        //anchoring logic
        triHourlyLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 16))
        
        imageView.anchor(top: triHourlyLabel.bottomAnchor,
                         leading: triHourlyLabel.leadingAnchor,
                         bottom: nil,
                         trailing: triHourlyLabel.trailingAnchor,
                         padding: .zero,
                         size: .init(width: 0, height: frame.width))
        tempLabel.anchor(top: imageView.bottomAnchor,
                         leading: triHourlyLabel.leadingAnchor,
                         bottom: bottomAnchor,
                         trailing: triHourlyLabel.trailingAnchor)
    }
    
    private lazy var populateLabels: (AccuWeatherUnit?) -> () = {
        guard let unit = $0 else { return }
        self.triHourlyLabel.text = unit.hourlyTime
        self.tempLabel.text = unit.degree
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        [triHourlyLabel, tempLabel, imageView].forEach( addSubview )
        anchorSubviews()
        setContentHuggingPriorities()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
