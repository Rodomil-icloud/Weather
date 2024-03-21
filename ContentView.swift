//
//  ContentView.swift
//  Weather
//
//  Created by Rodomil on 20.03.2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = MainViewModel()
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Image(viewModel.city.apiName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                    .frame(maxWidth: geometry.size.width,
                           maxHeight: geometry.size.height)
                    .opacity(0.8)
                    .blendMode(.lighten)
                    .blur(radius: /*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
            }
            VStack {
                Menu {
                    ForEach(viewModel.cityData) { item in
                        Button(item.name) { viewModel.city = item }
                    }
                } label: {
                    CustomTextSUI(text: viewModel.city.name, size: 35)
                }
                List(viewModel.listData) { item in
                    ListCellView(item: item)
                        .listRowBackground(Color.clear)
                }
                .frame( maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
                .listStyle(.plain)
                .background(Color.clear)
            }
        }
    }
}

#Preview {
    ContentView()
}
