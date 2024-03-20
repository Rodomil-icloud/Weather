//
//  MainViewModel.swift
//  Weather
//
//  Created by Rodomil on 20.03.2024.
//

import Foundation
import Combine

final class MainViewModel: ObservableObject {
    @Published var listData = [ListMLS]()
    @Published var city: CityStruct = CityStruct(name: "Москва", apiName: "Moscow")
    
    let cityData: [CityStruct] = [CityStruct(name: "Москва", apiName: "Moscow"),
                                  CityStruct(name: "Керчь", apiName: "Kerch"),
                                  CityStruct(name: "Ялта", apiName: "Yalta")]
    
    
    private var cancellebelSet: Set<AnyCancellable> = []
    
    init() {
        $city
            .flatMap { (city) -> AnyPublisher<[ListMLS], Never> in
                APIManager.shared.fetchWeathrData(city: city.apiName)
            }
            .assign(to: \.listData, on: self)
            .store(in: &self.cancellebelSet)
    }
    
    deinit {
            for cancel in cancellebelSet {
                cancel.cancel()
            }
        }
}
