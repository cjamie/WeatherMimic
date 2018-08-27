//
//  WeatherPresentationViewModel.swift
//  WeatherMimic
//
//  Created by Admin on 8/21/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

enum PresentationCells {
    case headline
}

protocol WeatherPresentationViewModelProtocol: class, WeatherFetching {
    var manager: WeatherMimicManager? { get set }
    var delegate: WeatherPresentationControllerProtocol? { get set }
    var handleFetchResult: WeatherForecastHandler? { get set }

    func getNumberOfSections() -> Int
    func getTableSection(byRow row: Int) -> PresentationCells?
    func changeTableSections(to newSection: [PresentationCells]?)
}



//this will be a class because we are maintaining the tableSections
final class WeatherPresentationViewModel: WeatherPresentationViewModelProtocol {
    
    var delegate: WeatherPresentationControllerProtocol?
    var tableSections: Box<[PresentationCells]?> //we don't want caller to have direct access to this.
    let networkServices: NetworkCommunicator
    
    init(_ controller: WeatherPresentationControllerProtocol) {
        self.delegate = controller
        
        let initialSections: [PresentationCells] = [.headline]
        tableSections = Box(initialSections)
        self.networkServices = NetworkCommunicator()
    }
    
    
    //Helper functions
    private func createManager(with forecastInstance: WeatherForecast) {
        self.manager = WeatherMimicManager(forecast: forecastInstance)
    }

    //MARK: WeatherPresentationViewModelProtocol

    func getNumberOfSections() -> Int {
        let retValue = tableSections.value?.count ?? 0
        print("retValue \(retValue)")
        return retValue
    }
    
    //this will be instantiated when service returns a response.
    var manager: WeatherMimicManager? {
        didSet{
            print("managerDidSet")
            guard let _ = manager else{
                print("manager didSet is nil")
                return
            }
            DispatchQueue.main.async {
                [weak self] in
                self?.delegate?.refreshUI()
            }
        }
    }
    
    func getTableSection(byRow row: Int) -> PresentationCells? {
        return tableSections.value?[row]
    }

    func changeTableSections(to newSections: [PresentationCells]?){
        self.tableSections.value = newSections
    }

    // Once you receive a successful response, then you can create your Manager instance
    lazy var handleFetchResult: WeatherForecastHandler? = {
        [weak self] fetchResult in
        print("handling the fetch result ")
        switch fetchResult {
        case .failure(let err):
            //TODO: handle error cases in UI
            print(err.localizedDescription)
        case .success(let forecastInstance):
            self?.manager = WeatherMimicManager(forecast: forecastInstance)
            guard let good = self?.manager else {
                print("it is still nil")
                return
            }
            print("setting the manager \(good) \(good.cityName) ")
//            print(forecastInstance) //this is valid.
        }
    }
}
