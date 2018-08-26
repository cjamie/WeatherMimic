//
//  ViewController.swift
//  WeatherMimic
//
//  Created by Admin on 8/21/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import os

typealias NetworkCallHandler = () -> ()

final class WeatherPresentationController: UIViewController {

    //should this be a protocol specifically suited for view controller?
    //note: we can use adapter pattern for this.
    
    var dependency: WeatherPresentationDescribing?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.blue
        print("weather presentation controller ")
        
        registerCells()
        networkCall()
    }
    
    lazy var networkCall: NetworkCallHandler = {
        NetworkCommunicator().getWeatherData {
            fetchResult in
            switch fetchResult{
            case .failure(let err):
                print(err.localizedDescription)
                os_log("error received in network communicator", log: .default, type: .debug)
            case .success(let forecastInstance):
                print(forecastInstance)
                //we want to adapt this instance into a weatherPresentationDescribing type
                self.dependency = WeatherMimicAdapter.weatherForecastToWeatherPresentationModel(forecastInstance)
            }
        }
    }
    
    //populate your controller here.
    private var populateViewClosure: (WeatherPresentationDescribing) -> () = {
        let a = $0
        let temp = $0.stateName
    }
    
    lazy var cv: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let height: CGFloat = view.frame.height
        let width: CGFloat = view.frame.width
//        layout.itemSize = CGSize(width: width, height: height) // size for item at equivalent
        
//        layout.scrollDirection = .vertical
        layout.sectionInset = .zero
        layout.minimumLineSpacing = 0// horizontal spacing betweencells.
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.isPagingEnabled = true
        
        cv.register(WeatherPresentationHeadlineCell.self, forCellWithReuseIdentifier: WeatherPresentationHeadlineCell.reuseIdentifier)
        
        return cv
    }()
    
    private func addSubviews() -> () {
        view.addSubview(cv)
    }
}

