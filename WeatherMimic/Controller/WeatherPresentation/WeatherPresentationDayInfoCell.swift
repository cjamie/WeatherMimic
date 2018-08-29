//
//  WeatherPresentationDayInfoCell.swift
//  WeatherMimic
//
//  Created by Admin on 8/29/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import os.log

final class WeatherPresentationDayInfoCell: UICollectionViewCell {
    
    static let reuseIdentifier = "WeatherPresentationDayInfoCell"
    
    public static let nib = UINib(nibName: "WeatherPresentationDayInfoCell", bundle: WeatherMimic.bundle())

    @IBOutlet weak var weekdayLabel: UILabel!
    @IBOutlet weak var todayLabel: UILabel!
    @IBOutlet weak var highTempLabel: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!
    
    override func awakeFromNib() {
        print("info cell awake from nib execution... come out from freezedry")

        weekdayLabel.font = UIFont.from(nameSize: FontPresets.weekday)
        todayLabel.font = UIFont.from(nameSize: FontPresets.todayText)
        highTempLabel.font = UIFont.from(nameSize: FontPresets.AvenirNextMedium26)
        lowTempLabel.font = UIFont.from(nameSize: FontPresets.AvenirNextMedium26)
        
        //TODO: is is better practice for it to referene all the same fonts?
    }
    
    var boxedManager: Box<WeatherMimicManager?> = Box(nil) {
        didSet {
            boxedManager.bind {
                [weak self] manager in //Question: is this weak self necessary here?
                guard let strongSelf = self, let manager = manager else {
                    os_log("DayInfo cell is nil")
                    return
                }
                let dayInfoAdapted: DayInfoDescribing = manager
                
                strongSelf.weekdayLabel.text = dayInfoAdapted.weekDay
                strongSelf.todayLabel.text = WeatherMimic.localizedString(for: "com.WeatherMimic.WeatherPresentation.today")
                strongSelf.highTempLabel.text = dayInfoAdapted.highTemp
                strongSelf.lowTempLabel.text = dayInfoAdapted.lowTemp
            }
        }
    }
    
    //this will be used for height calculation
    static var fromNib: WeatherPresentationDayInfoCell? {
        return WeatherMimic.bundle().loadNibNamed(reuseIdentifier, owner: nil, options: nil)?.first as? WeatherPresentationDayInfoCell
    }
}

extension WeatherPresentationDayInfoCell: ViewHeightDelegate {

    //TODO: figure out content hugging priority
    var viewHeight: CGFloat {
 
        let allLabels = [weekdayLabel, todayLabel, highTempLabel, lowTempLabel].compactMap{$0}
        
        allLabels.forEach{ $0.sizeToFit() }
        
        let temp = allLabels.map{$0.frame.height}
        print("printing all of the heights: ")
        temp.forEach {  print($0) }
        let finalHeight = allLabels.map{$0.frame.height}.max() ?? 0    

        
        print("final height determined to be: \(finalHeight)")
        return finalHeight
    }
}

