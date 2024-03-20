//
//  ListCell.swift
//  Weather
//
//  Created by Rodomil on 20.03.2024.
//

import SwiftUI
import Kingfisher

struct ListCellView: View {
    let item: ListMLS
    var body: some View {
        VStack {
            HStack{
                if item.isRight ?? false { Spacer() }
                VStack{
                    CustomTextSUI(text: item.dt_txt, size: 24)
                    HStack {
                        KFImage(URL(string: "https://openweathermap.org/img/wn/\(item.weather[0].icon)@2x.png")!)
                        VStack {
                            CustomTextSUI(text: "\(Int(item.main.temp))º C", size: 35)
                            CustomTextSUI(text: item.weather[0].description, size: 20)
                            
                        }
                    }
                    
                }
                if !(item.isRight ?? false ) { Spacer() }
            }
            Divider().frame(height: 2).background(Color.white)
                .edgesIgnoringSafeArea(.all)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ListCellView(item: ListMLS(main: MainLMLS(temp: 4.5, feels_like: 3.2, temp_min: 1.4, temp_max: 4.8, pressure: 1024, humidity: 60), weather: [WeatherLMLS(description: "пасмурно", icon: "04d")], dt_txt: "2024-03-20"))
}
