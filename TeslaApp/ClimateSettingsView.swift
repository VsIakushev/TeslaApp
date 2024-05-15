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
    
    @State var isClimateControlsIsEnabled = true
    @State var isSettingsExpanded = true
    
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
                    isClimateControlsIsEnabled.toggle()
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
    
    var gradient: LinearGradient {
        LinearGradient(colors: [.gradientTop, .gradientBottom], startPoint: .bottom, endPoint: .top)
    }
    
    var settingsView: some View {
        DisclosureGroup(isExpanded: $isSettingsExpanded) {
            HStack {
                Text("Ac")
                    .font(.system(size: 19))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .opacity(0.6)
                    .padding(.horizontal)
                    .frame(width:  80)
                    
                Button(action: {
                    isClimateControlsIsEnabled.toggle()
                }, label: {
                    Image("ac")
                        .padding()
                        .neomorphismUnSelectedSphericButton()
                        .neomorphismUnSelectedSperic()
                        .overlay {
                            Circle()
                                .stroke(gradient, lineWidth: 2)
                                .opacity(isClimateControlsIsEnabled ? 1 : 0)
                        }
                })
                Spacer()
                sliderView(value: $temperature, minSliderValue: $minTemperature, maxSliderValue: $maxTemperature, isEnabled: $isClimateControlsIsEnabled)
                    .padding(.trailing)
            }
            .padding(.top, 10)
            
            HStack {
                Text("Fan")
                    .font(.system(size: 19))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .opacity(0.6)
                    .padding(.horizontal)
                    .frame(width:  80)
                Button(action: {}, label: {
                    Image("fan")
                        .padding()
                        .neomorphismUnSelectedSphericButton()
                        .neomorphismUnSelectedSperic()
                })
                Spacer()
                sliderView(value: .constant(0), minSliderValue: .constant(0), maxSliderValue: .constant(15), isEnabled: .constant(false))
                    .padding(.trailing)
            }
            .padding(.top, 10)
            
            HStack {
                Text("Heat")
                    .font(.system(size: 19))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .opacity(0.6)
                    .padding(.horizontal)
                    .frame(width:  80)
                Button(action: {}, label: {
                    Image("heat")
                        .padding()
                        .neomorphismUnSelectedSphericButton()
                        .neomorphismUnSelectedSperic()
                })
                Spacer()
                sliderView(value: .constant(0), minSliderValue: .constant(0), maxSliderValue: .constant(15), isEnabled: .constant(false))
                    .padding(.trailing)
            }
            .padding(.top, 10)
            
            HStack {
                Text("Auto")
                    .font(.system(size: 19))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .opacity(0.6)
                    .padding(.horizontal)
                    .frame(width:  80)
                Button(action: {}, label: {
                    Image("auto")
                        .padding()
                        .neomorphismUnSelectedSphericButton()
                        .neomorphismUnSelectedSperic()
                })
                Spacer()
                sliderView(value: .constant(0), minSliderValue: .constant(0), maxSliderValue: .constant(15), isEnabled: .constant(false))
                    .padding(.trailing)
            }
            .padding(.top, 10)
            .padding(.bottom)
            }
        
            label: {
                Text("Climate control")
            }
            .accentColor(.white.opacity(0.6))
            .padding(15)
        
        
    }
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                header
                Spacer().frame(height: 100)
                TemperatureTwisterView(temperature: $temperature, circleProgress: $circleProgress, progressColor: $progressColor, minTemperature: $minTemperature, maxTemperature: $maxTemperature, isEnabled: $isClimateControlsIsEnabled)
                
                settingsView

                Spacer()
            }
        }
    }
    
    @Environment (\.presentationMode) var presentation
}

#Preview {
    ClimateSettingsView()
}
