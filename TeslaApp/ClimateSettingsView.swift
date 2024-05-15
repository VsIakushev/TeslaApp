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
    @State var showSupportAlert = false
    
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
    
    var gradient: LinearGradient {
        LinearGradient(colors: [.gradientTop, .gradientBottom], startPoint: .bottom, endPoint: .top)
    }
    
    private var alertView: some View {
        ZStack {
         BackgroundView()
                .cornerRadius(25)
            VStack {
                Text("Need help?")
                    .foregroundColor(.white)
                    .font(.title3)
                    .padding()
                if let url = URL(string: "https://www.tesla.com/support ") {
                    Link(destination: url) {
                        Text("Tesla Support")
                            .font(.title3)
                            .bold()
                    }
                        .padding()
                }
                    
                Button(action: {
                    withAnimation {
                        showSupportAlert = false
                    }
                }, label: {
                    Text("Close")
                        .foregroundColor(.gray)
                        .font(.title3)
                        .padding()
                })
            }
        }
        .frame(width: 300, height: 250)
        .shadow(color: .white.opacity(0.15), radius: 5, x: -5, y: -5)
        .shadow(color: .black.opacity(0.35), radius: 5, x: 5, y: 5)
        .padding(.top, 150)
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
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
            BackgroundView()
            if showSupportAlert {
                alertView
                    .transition(.move(edge: .top).combined(with: .scale(scale: 0.1, anchor: .topTrailing)).combined(with: .opacity))
                    .zIndex(1)
            }
            VStack {
                header
                Spacer().frame(height: 100)
                TemperatureTwisterView(temperature: $temperature, circleProgress: $circleProgress, progressColor: $progressColor, minTemperature: $minTemperature, maxTemperature: $maxTemperature, isEnabled: $isClimateControlsIsEnabled)
        
                settingsView
                Spacer()
            }
            .blur(radius: showSupportAlert ? 5 : 0)
        }
    }
    
    @Environment (\.presentationMode) var presentation
}

#Preview {
    ClimateSettingsView()
}
