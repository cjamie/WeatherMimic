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
    
    //this will have an array of items that can power a collectionview.
//    var boxedManager: Box<WeatherMimicManager?> = Box(nil) {
//        didSet {
//            boxedManager.bind {
//                [weak self] manager in //Question: is this weak self necessary here?
//                guard let strongSelf = self, let manager = manager else {
//                    os_log("DayInfo cell is nil")
//                    return
//                }
////                let dayInfoAdapted: DayInfoDescribing = manager
//            }
//        }
//    }
    
    //this will provide the list of items it needs.
    var viewModel: WeatherPresentationViewModelProtocol!

}

//extension WeatherPresentationHorizontalScrollCell: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//    
//    
//}

extension WeatherPresentationHorizontalScrollCell: UICollectionViewDelegate {
    
}
