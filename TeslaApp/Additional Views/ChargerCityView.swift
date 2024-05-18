//
//  ChargerView.swift
//  TeslaApp
//
//  Created by Vitaliy Iakushev on 17.05.2024.
//

import SwiftUI

/// Element view for superchargers list
struct ChargerCityView: View {
    @State var city: String
    @State var availableChargers: Int
    @State var totalChargers: Int
    @State var distance: Double
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Tesla Supercharger -")
                    .font(.system(size: 13))
                    .foregroundColor(.white.opacity(0.7))
                    .bold()
                Spacer().frame(height: 3)
                Text(city)
                    .font(.system(size: 13))
                    .foregroundColor(.white.opacity(0.7))
                    .bold()
                Spacer().frame(height: 3)
                Text("\(availableChargers)")
                    .font(.system(size: 13))
                    .foregroundColor(.white)
                +
                Text(" / \(totalChargers) available")
                    .font(.system(size: 13))
                    .foregroundColor(.white.opacity(0.7))
            }
            
            Spacer()
            VStack {
                Image("mapPin")
                Text("\(String(format: "%.1f", distance)) ml")
                    .font(.system(size: 13))
                    .foregroundColor(.white.opacity(0.7))
            }
            .frame(width: 50)
        }
        .padding(.bottom)
        .padding(.horizontal, 30)
    }
}
