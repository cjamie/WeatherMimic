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
    
    //TODO: need to build the viewmodel from here.
    //TODO: pass in a a boxed manager in here instead. 
//    var viewModelManager: HeadlineDescribing? {
//        didSet {
//            guard let viewModelManager = viewModelManager else {
//                return
//            }
//            cityLabel.text = viewModelManager.cityName
//            descriptionLabel.text = viewModelManager.weatherDescription
//        }
//    }
    
    
    var viewModelManager: Box<WeatherMimicManager?> = Box(nil){
        didSet{
            viewModelManager.bind {
                [weak self] manager in
                guard let strongSelf = self else {
                    os_log("cell self is nil")
                    return
                }
                print("bind closure is called")
                let headlineAdapted: HeadlineDescribing? = manager
                
                DispatchQueue.main.async {
                    self?.cityLabel.text = headlineAdapted?.cityName
                    self?.descriptionLabel.text = headlineAdapted?.weatherDescription
                }
            }
        }
    }
    
    lazy var cityLabel: UILabel = {
        UIView.build(block: LabelPresets.cityNameLabelModifer)
    }()
    
    //TODO: these closures can be put into a presets struct    
    lazy var descriptionLabel: UILabel = {
        UIView.build(block: LabelPresets.descriptionLabelModifier)
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        subviewsToAdd.forEach(addSubview)
        anchorSubviews()
        
        backgroundColor = UIColor.red
        
//        viewModelManager.bind {
//            [weak self] manager in
//            guard let strongSelf = self else {
//                os_log("cell self is nil")
//                return
//            }            
//            print("bind closure is called")
//            let headlineAdapted: HeadlineDescribing? = manager
//            
//            DispatchQueue.main.async {
//                self?.cityLabel.text = headlineAdapted?.cityName
//                self?.descriptionLabel.text = headlineAdapted?.weatherDescription
//            }
//        }
    }
    
    var subviewsToAdd: [UIView] {
        return [ cityLabel, descriptionLabel ]
    }
    
    private func anchorSubviews() {
        let cityLabelPadding = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        
        cityLabel.anchor(top: topAnchor,
                         leading: leadingAnchor,
                         bottom: nil,
                         trailing: trailingAnchor,
                         padding: cityLabelPadding)
        descriptionLabel.anchor(top: cityLabel.bottomAnchor,
                                leading: cityLabel.leadingAnchor,
                                bottom: nil,
                                trailing: cityLabel.trailingAnchor)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
