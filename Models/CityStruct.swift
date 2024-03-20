//
//  CityStruct.swift
//  Weather
//
//  Created by Rodomil on 20.03.2024.
//

import Foundation

struct CityStruct: Identifiable {
    let id = UUID()
    let name: String
    let apiName: String
}
