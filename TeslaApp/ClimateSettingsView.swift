//
//  ClimateSettingsView.swift
//  TeslaApp
//
//  Created by Vitaliy Iakushev on 14.05.2024.
//

import SwiftUI

struct ClimateSettingsView: View {
    
    @State private var temperature = 15.0
    @State private var circleProgress: CGFloat = 0.1
    @State private var progressColor: Color = .gradientTop
    
    @State var minTemperature = 15.0
    @State var maxTemperature = 30.0
    
    @State var climateControlsIsEnabled = true
    
    var header: some View {
        HStack {
            Button {
                presentation.wrappedValue.dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .foregroundColor(.gray)
                    .bold()
                    .padding()
                    .neomorphismUnSelectedSphericButton()
                    .neomorphismUnSelectedSperic()
            }
            Spacer()
            Text("CLIMATE")
                .font(.system(size: 20))
                .fontWeight(.semibold)
            Spacer()
            Button {
                withAnimation {
                    climateControlsIsEnabled.toggle()
                }
            } label: {
                Image("gear")
                    .padding(12)
                    .padding(.top, 7)
                    .neomorphismUnSelectedSphericButton()
                    .neomorphismUnSelectedSperic()
            }
        }
        .padding(.horizontal, 40)
    }
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                header
                Spacer().frame(height: 100)
                TemperatureTwisterView(temperature: $temperature, circleProgress: $circleProgress, progressColor: $progressColor, minTemperature: $minTemperature, maxTemperature: $maxTemperature, isEnabled: $climateControlsIsEnabled)
                
                sliderView(value: $temperature, minSliderValue: $minTemperature, maxSliderValue: $maxTemperature, isEnabled: $climateControlsIsEnabled)
                Spacer()
            }
        }
    }
    
    @Environment (\.presentationMode) var presentation
}

#Preview {
    ClimateSettingsView()
}
