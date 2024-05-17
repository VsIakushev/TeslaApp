//
//  BatteryView.swift
//  TeslaApp
//
//  Created by Vitaliy Iakushev on 16.05.2024.
//

import SwiftUI

struct ChargingView: View {
    
    @State var showSupportAlert = false
    @State var chargingProgress: CGFloat = 0.7
    @State var isSuperchargersExpanded = false
    
    @State private var chargerCities: [SuperchargerCity] = [
        .init(city: "Sacramento, CA", availableChargers: 7, totalChargers: 16, distanceToClosestCharger: 2.4),
        .init(city: "Stockton, CA", availableChargers: 3, totalChargers: 5, distanceToClosestCharger: 45.7),
        .init(city: "San-Francisco, CA", availableChargers: 17, totalChargers: 32, distanceToClosestCharger: 82.2),
        .init(city: "San-Jose, CA", availableChargers: 11, totalChargers: 24, distanceToClosestCharger: 96.7)
    ]
    
    var gradient: LinearGradient {
        LinearGradient(colors: [.gradientTop, .gradientBottom], startPoint: .bottom, endPoint: .top)
    }
    
    var header: some View {
        HStack {
            Button {
                withAnimation {
                    presentation.wrappedValue.dismiss()
                }
            } label: {
                Image(systemName: "chevron.left")
                    .foregroundColor(.gray)
                    .bold()
                    .padding()
                    .neomorphismUnSelectedSphericButton()
                    .neomorphismUnSelectedSperic()
            }
            Spacer()
            Text("CHARGING")
                .font(.system(size: 20))
                .fontWeight(.semibold)
            Spacer()
            Button {
                withAnimation {
                    showSupportAlert.toggle()
                }
            } label: {
                Image("gear")
                    .padding(15)
                    .neomorphismUnSelectedSphericButton()
                    .neomorphismUnSelectedSperic()
            }
        }
        .padding(.horizontal, 40)
    }
    
    var carImageView: some View {
        Image("teslaBattery")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: 120)
            .padding(.horizontal)
            .padding(.top, 30)
            .shadow(color: .white.opacity(0.5), radius: 15, x: 10, y: 10)
    }
    
    var percentageLabels: some View {
        HStack {
            Text(calculateProgressToString())
                .foregroundColor(.white.opacity(1))
                .font(.title)
                .bold()
            +
            Text(" %")
                .font(.title3)
                .foregroundColor(.white.opacity(0.8))
        }
    }
    
    var chargingGoals: some View {
        VStack {
            HStack {
                Spacer()
                Rectangle()
                    .fill(gradient)
                    .frame(width: 2, height: 9)
                Spacer().frame(width: 63)
                Rectangle()
                    .fill(gradient)
                    .frame(width: 2, height: 9)
            }
            HStack {
                Spacer()
                Text("75%")
                    .font(.system(size: 13))
                    .foregroundColor(.white)
                Spacer().frame(width: 30)
                Text("100%")
                    .font(.system(size: 13))
                    .foregroundColor(.white.opacity(0.8))
            }
        }
        .frame(width: 270)
        .padding(.vertical, 10)
    }
    
    var supercgargers: some View {
        ZStack {
            
        }
    }
    
    var body: some View {
        ZStack {
            if showSupportAlert {
                SupportAlertView(showAlert: $showSupportAlert)
                    .transition(.move(edge: .top).combined(with: .scale(scale: 0.1, anchor: .topTrailing)).combined(with: .opacity))
                    .zIndex(1)
                    .padding(.bottom, 200)
            }
            
            BackgroundView()

            VStack {
                header
                    carImageView
                    percentageLabels
                    BatteryView(progress: $chargingProgress)
                    chargingGoals
                    batterySliderView(value: $chargingProgress)
                        .padding(.bottom, 5)
                    Text("Set Charge Limit")
                        .font(.system(size: 13))
                        .foregroundColor(.white.opacity(0.8))
                        .padding(.bottom)
                
                SuperchargersView(isExpanded: $isSuperchargersExpanded, chargerCities: $chargerCities)
                
                Spacer()
            }
            .blur(radius: showSupportAlert ? 5 : 0)
            .disabled(showSupportAlert)
        }
    }
    
    private func calculateProgressToString() -> String {
        String(Int(chargingProgress * 100))
    }
    
    @Environment (\.presentationMode) var presentation
}

#Preview {
        ChargingView()

}
