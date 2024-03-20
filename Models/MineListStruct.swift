//
//  MineListStruct.swift
//  Weather
//
//  Created by Rodomil on 20.03.2024.
//

import Foundation

struct MineListStruct: Decodable {
    let list: [ListMLS]
    
    func sortData() -> [ListMLS] {
        var temp = [ListMLS]()
        var tempDate = ""
        var isRight = false
        list.forEach { item in
            let dateArr = item.dt_txt.components(separatedBy: " ")
            if dateArr[0] != tempDate {
                tempDate = dateArr[0]
                var i = item
                i.dt_txt = dateArr.first ?? ""
                i.id = UUID()
                i.isRight = isRight
                isRight.toggle()
                temp.append(i)
                print(dateArr[0])
            }
            else {
                return
            }
        }
        return temp
    }
}

struct ListMLS: Decodable, Identifiable {
    var id: UUID? = UUID()
    let main: MainLMLS
    let weather: [WeatherLMLS]
    var dt_txt: String
    var isRight: Bool? = false
}

struct MainLMLS: Decodable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Double
    let humidity: Double
}

struct WeatherLMLS: Decodable {
    let description: String
    let icon: String
}

