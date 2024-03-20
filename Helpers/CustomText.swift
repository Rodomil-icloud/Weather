//
//  CustomText.swift
//  Weather
//
//  Created by Rodomil on 20.03.2024.
//


import SwiftUI

struct CustomTextSUI: View {
    
    var text: String
    var size: CGFloat
    
    var body: some View {
        Text(text)
            .foregroundColor(.black)
            .font(.custom("Arial", size: size))
    }
  
}
