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
    case temperature
    case dayInfo
}

protocol WeatherPresentationViewModelProtocol: class, WeatherFetching {
    var manager: Box<WeatherForecastDataManager?> { get set}
    
    var delegate: WeatherPresentationControllerProtocol? { get set }
    var handleFetchResult: WeatherForecastHandler? { get set }
    var numberOfSections: Int { get }
    
    func getTableSection(byRow row: Int) -> PresentationCells?
    func changeTableSections(to newSections: [PresentationCells]?)
    
    // for the horizontal scrolling cell
    var numberOfAccuweatherCells: Int { get }
    
}

//this will be a class because we are maintaining the tableSections
final class WeatherPresentationViewModel: WeatherPresentationViewModelProtocol {
    
    //we want to be able to set the manager from inside here.
    var manager: Box<WeatherForecastDataManager?> = Box(nil)
    
    var delegate: WeatherPresentationControllerProtocol?
    var tableSections: Box<[PresentationCells]?> //we don't want caller to have direct access to this.
    let networkServices: NetworkCommunicator = NetworkCommunicator()
    
    init(_ controller: WeatherPresentationControllerProtocol) {
        self.delegate = controller
        
        let initialSections: [PresentationCells] = [.headline, .temperature, .dayInfo]
        tableSections = Box(initialSections)
        
        tableSections.bind {
            print("this was updated to \($0)")
        }
    }
    
    //Helper functions
    
    //MARK: WeatherPresentationViewModelProtocol
    
    var numberOfSections: Int {
        return tableSections.value?.count ?? 0
    }
    
    func getTableSection(byRow row: Int) -> PresentationCells? {
        return tableSections.value?[row]
    }
    
    func changeTableSections(to newSections: [PresentationCells]?) {
        self.tableSections.value = newSections
    }
    
    // Once you receive a successful response, then you can create your Manager instance
    lazy var handleFetchResult: WeatherForecastHandler? = {
        [weak self] fetchResult in
        switch fetchResult {
        case .failure(let err):
            //TODO: handle error cases in UI
            print("network failure")
            //TODO: create a custom os_log for this
            print(err.localizedDescription)
        case .success(let forecastInstance):
            print("handling successful network call!")
            let myManager = WeatherForecastDataManager(forecast: forecastInstance)
            self?.manager = Box(myManager)
            
            //this might be responsibility of the cell
                        
            self?.manager.bind { _ in
                DispatchQueue.main.async {
                    [weak self] in
                    self?.delegate?.refreshUI()
                }
            }
        }
    }
    
    //TODO: verify
    var numberOfAccuweatherCells: Int {
        return manager.value?.horizontalDataSource.count ?? 0
    }

}
