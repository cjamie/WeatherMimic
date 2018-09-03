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
        //this bottom constant dos not matter since there is no anchor
        static let cityLabelPadding = UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 16)
        static let descriptionLabelPadding = UIEdgeInsets(top: 8, left: 0, bottom: 16, right: 0)
    }
    
    //is it possible to bind thing without a didSet (its is dependent on a network call)
    var boxedManager: Box<WeatherForecastDataManager?> = Box(nil) {
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
                
//  we can use this to verify that height will dynamically size.
//                strongSelf.descriptionLabel.text = "Temporary Temporary Temporary Temporary Temporary Temporary Temporary Temporary Temporary Temporary Temporary Temporary Temporary Temporary Temporary Temporary Temporary Temporary Temporary Temporary Temporary Temporary Temporary Temporary Temporary "
                
                strongSelf.descriptionLabel.text = headlineAdapted?.weatherDescription
            }
        }
    }
    
    // View Elements
    lazy var cityLabel: UILabel = {
        UIView.build(block: ViewPresets.cityNameLabelModifer)
    }()
    
    lazy var descriptionLabel: UILabel = {
        UIView.build(block: ViewPresets.descriptionLabelModifier)
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
        
        //descriptionLabel's anchors will be dependent on cityLabel's

        
        descriptionLabel.anchor(top: cityLabel.bottomAnchor,
                                leading: cityLabel.leadingAnchor,
                                bottom: nil,
                                trailing: cityLabel.trailingAnchor,
                                padding: Constants.descriptionLabelPadding)
        
        //alternative
//        descriptionLabel.centerXAnchor.constraint(equalTo: cityLabel.centerXAnchor).isActive = true
//        let widthConstraint = NSLayoutConstraint(item: descriptionLabel, attribute: .width, relatedBy: .lessThanOrEqual, toItem: descriptionLabel.superview, attribute: .width, multiplier: 1.0, constant: 0.0)
//        descriptionLabel.addConstraint(widthConstraint)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension WeatherPresentationHeadlineCell: ViewHeightDelegate {
    /*
     these heights will be dependent on cityLabel, and descriptionLabel
     this should be calculated after a value has been set
     the goal is have this function dynamically adapt to changing values in Constants
     */    
    //TODO: why is frame.width 0?
    var viewHeight: CGFloat {
        //base height calculation
        let baseHeightArray = [Constants.cityLabelPadding.top,
                               Constants.descriptionLabelPadding.top,
                               Constants.descriptionLabelPadding.bottom]
        let baseHeight = baseHeightArray.reduce(0, +)
        
        //city label height calculation
        let cityLabelWidth = UIScreen.main.bounds.width - (Constants.cityLabelPadding.left + Constants.cityLabelPadding.right)
        let cityLabelHeight = (cityLabel.text ?? "").height(withConstrainedWidth: cityLabelWidth, font: cityLabel.font)
    
        //description label calculation
        let descriptionLabelHeight = (descriptionLabel.text ?? "").height(withConstrainedWidth: cityLabelWidth, font: descriptionLabel.font)
        
        let totalHeight =  [ cityLabelHeight, descriptionLabelHeight ].reduce(baseHeight, +)
        print("calculated total height is \(totalHeight)")
        return totalHeight
    }
}
