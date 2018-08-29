//
//  WeatherPresentationHeadlineCell.swift
//  WeatherMimic
//
//  Created by Admin on 8/25/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import os.log

typealias LabelBuilder = (UILabel) -> ()

final class WeatherPresentationHeadlineCell: UICollectionViewCell {
    
    static let reuseIdentifier = "WeatherPresentationHeadlineCell"
    
    private enum Constants {
        static let cityLabelPadding = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
    
    var boxedManager: Box<WeatherMimicManager?> = Box(nil) {
        didSet {
            boxedManager.bind {
                [weak self] manager in //Question: is this weak self necessary here?
                guard let strongSelf = self else {
                    os_log("cell self is nil")
                    return
                }
                print("bind closure is called")
                let headlineAdapted: HeadlineDescribing? = manager
                strongSelf.cityLabel.text = headlineAdapted?.cityName
                strongSelf.descriptionLabel.text = headlineAdapted?.weatherDescription
            }
        }
    }
    
    // View Elements
    lazy var cityLabel: UILabel = {
        UIView.build(block: LabelPresets.cityNameLabelModifer)
    }()
    
    lazy var descriptionLabel: UILabel = {
        UIView.build(block: LabelPresets.descriptionLabelModifier)
    }()

    // init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        subviewsToAdd.forEach( addSubview )
        anchorSubviews()
        backgroundColor = UIColor.red
    }
    
    var subviewsToAdd: [UIView] {
        return [ cityLabel, descriptionLabel ]
    }
    
    private func anchorSubviews() {
        
        cityLabel.anchor(top: topAnchor,
                         leading: leadingAnchor,
                         bottom: nil,
                         trailing: trailingAnchor,
                         padding: Constants.cityLabelPadding)
        
        //descriptionLabel'sanchors will be dependent on cityLabel's
        descriptionLabel.anchor(top: cityLabel.bottomAnchor,
                                leading: cityLabel.leadingAnchor,
                                bottom: nil,
                                trailing: cityLabel.trailingAnchor)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension WeatherPresentationHeadlineCell: ViewHeightDelegate {

    /*
     these heights will be dependent on cityLabel, and descriptionLabel
     this should be calculated after a value has been set
     */

    var viewHeight: CGFloat {
        
        guard let boxedManagerValue = boxedManager.value else {
            os_log("manager value is nil")
            return 0
        }
        //base height calculation
        
        let baseHeightArray = [Constants.cityLabelPadding.top, Constants.cityLabelPadding.bottom]
        let baseHeight = baseHeightArray.reduce(0, +)
        
        //city label calculation
        let cityLabelWidth = frame.width - (Constants.cityLabelPadding.left + Constants.cityLabelPadding.right)
        let cityFont:UIFont = cityLabel.font
        print(" the city font is \(cityFont)")
        let cityLabelHeight = boxedManagerValue.cityName.height(withConstrainedWidth: cityLabelWidth, font: cityFont)
    
        //description label calculation
        let descriptionFont: UIFont = descriptionLabel.font
        let descriptionLabelHeight = boxedManagerValue.weatherDescription.height(withConstrainedWidth: cityLabelWidth, font: descriptionFont)
        
        let totalHeight =  [cityLabelHeight, descriptionLabelHeight ].reduce(baseHeight, +)

        print("calculated total heigth is ")
        return totalHeight
    }
}
