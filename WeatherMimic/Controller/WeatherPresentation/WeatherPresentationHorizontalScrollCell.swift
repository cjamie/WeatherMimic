//
//  WeatherPresentationHorizontalScrollCell.swift
//  WeatherMimic
//
//  Created by Admin on 8/29/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import os.log

final class WeatherPresentationHorizontalScrollCell: UICollectionViewCell {
    
    var boxedManager: Box<WeatherMimicManager?> = Box(nil) {
        didSet {
            boxedManager.bind {
                [weak self] manager in //Question: is this weak self necessary here?
                guard let strongSelf = self, let manager = manager else {
                    os_log("DayInfo cell is nil")
                    return
                }
//                let dayInfoAdapted: DayInfoDescribing = manager
            }
        }
    }
    
}

//extension WeatherPresentationHorizontalScrollCell: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        guard let manager = boxedManager.value as? HourlyForecastDescribing else {
//            os_log("missing manager value for horizontal collectionview")
//            return 0
//        }
//        return manager.hourlyDatasource.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: <#T##String#>, for: <#T##IndexPath#>) else {
//            fatalError("bad cell")
//        }
//        return cell
//    }
//
//
//}
