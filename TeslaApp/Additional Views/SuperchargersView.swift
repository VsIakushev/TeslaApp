//
//  SuperchargersView.swift
//  TeslaApp
//
//  Created by Vitaliy Iakushev on 17.05.2024.
//

import SwiftUI

struct SuperchargersView: View {
    
    @Binding var isExpanded: Bool
    @Binding var chargerCities: [SuperchargerCity]
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 40)
                .fill(.appBackground)
                .overlay {
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.appBackground.opacity(0.9), lineWidth: 1)
                        .shadow(color: .white.opacity(0.7), radius: 4, x: -4, y: -4)
                        .shadow(color: .black.opacity(0.9), radius: 5, x: 5, y: 5)
                        .clipShape(RoundedRectangle(cornerRadius: 40))
                }
            
            VStack {
                HStack {
                    Text("Nearby Superchargers")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .bold()
                        .padding(.leading, 25)
                    Spacer()
                    
                    Button {
                        withAnimation {
                            isExpanded.toggle()
                        }
                    } label: {
                        Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                            .foregroundColor(.white.opacity(0.8))
                            .bold()
                            .padding()
                            .neomorphismUnSelectedSphericButton()
                            .neomorphismUnSelectedSperic()
                            .padding(.trailing, 30)
                    }
                }
                .padding(.vertical, 20)
                ScrollView {
                    ForEach(chargerCities) { charger in
                        ChargerCityView(city: charger.city, availableChargers: charger.availableChargers, totalChargers: charger.totalChargers, distance: charger.distanceToClosestCharger)
                    }
                }
                .scrollIndicators(.hidden)
            }
        }
        .frame(width: UIScreen.main.bounds.width - 60)
        .frame(height: isExpanded ? 260 : 90)
    }
}

#Preview {
    ZStack {
        BackgroundView()
        SuperchargersView(isExpanded: .constant(false), chargerCities: .constant([.init(city: "Sacramento, CA", availableChargers: 7, totalChargers: 16, distanceToClosestCharger: 2.4), .init(city: "San-Francisco, CA", availableChargers: 17, totalChargers: 32, distanceToClosestCharger: 96.2)]))
    }
    
}


