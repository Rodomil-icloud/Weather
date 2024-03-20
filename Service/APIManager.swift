//
//  APIManager.swift
//  Weather
//
//  Created by Rodomil on 20.03.2024.
//

import Combine
import Foundation

final class APIManager {
    static let shared = APIManager()
    
    func fetchWeathrData(city: String) -> AnyPublisher<[ListMLS], Never> {
        print("data")
        let urls = "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&appid=f4360915470243c64601d55e986c3cd1&lang=Ru&units=metric"
        guard let url = URL(string: urls)?.absoluteURL else { return Just([ListMLS]()).eraseToAnyPublisher() }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: MineListStruct.self, decoder: JSONDecoder())
            .map { $0.sortData() }
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
}
