//
//  ClimateSettingsView.swift
//  TeslaApp
//
//  Created by Vitaliy Iakushev on 14.05.2024.
//

import SwiftUI

/// Climate Settings Screen
struct ClimateSettingsView: View {
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
            BackgroundView()
            if showSupportAlert {
                SupportAlertView(showAlert: $showSupportAlert)
                    .transition(.move(edge: .top).combined(with: .scale(scale: 0.1, anchor: .topTrailing)).combined(with: .opacity))
                    .zIndex(1)
            }

            VStack {
                header
                Spacer().frame(height: 100)
                TemperatureTwisterView(temperature: $temperature, circleProgress: $circleProgress, interfaceColor: $interfaceColor, minTemperature: $minTemperature, maxTemperature: $maxTemperature, isEnabled: $isClimateControlsIsEnabled)
        
                settingsView
                
                Spacer()
            }
            .blur(radius: showSupportAlert ? 5 : 0)
            .disabled(showSupportAlert)
            
        }
        .overlay {
            BottomSheetView(isAcOn: $isClimateControlsIsEnabled, color: $interfaceColor, temperature: $temperature, minTemperature: $minTemperature, maxTemperature: $maxTemperature)
                .blur(radius: showSupportAlert ? 5 : 0)
                .disabled(showSupportAlert)
        }
    }
    
    @Environment (\.presentationMode) private var presentation
    
    @State private var temperature = 15.0
    @State private var circleProgress: CGFloat = 0.1
    @State private var minTemperature = 15.0
    @State private var maxTemperature = 30.0
    @State private var isClimateControlsIsEnabled = false
    @State private var isSettingsExpanded = true
    @State private var showSupportAlert = false
    @State private var interfaceColor: Color = .gradientTop
    
    private var header: some View {
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
    
    private var gradient: LinearGradient {
        LinearGradient(colors: [.gradientTop, .gradientBottom], startPoint: .bottom, endPoint: .top)
    }
    
    private var settingsView: some View {
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
                    withAnimation {
                        isClimateControlsIsEnabled.toggle()
                    }
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
                sliderView(value: $temperature, minSliderValue: $minTemperature, maxSliderValue: $maxTemperature, isEnabled: $isClimateControlsIsEnabled, interfaceColor: $interfaceColor)
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
                sliderView(value: .constant(0), minSliderValue: .constant(0), maxSliderValue: .constant(15), isEnabled: .constant(false), interfaceColor: $interfaceColor)
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
                sliderView(value: .constant(0), minSliderValue: .constant(0), maxSliderValue: .constant(15), isEnabled: .constant(false), interfaceColor: $interfaceColor)
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
                sliderView(value: .constant(0), minSliderValue: .constant(0), maxSliderValue: .constant(15), isEnabled: .constant(false), interfaceColor: $interfaceColor)
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
}

#Preview {
    ClimateSettingsView()
}
