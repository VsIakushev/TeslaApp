//
//  TabBarView.swift
//  TeslaApp
//
//  Created by Vitaliy Iakushev on 16.05.2024.
//

import SwiftUI

struct TabBarView: View {
    
    @State private var selectedTab = 0
    
    var gradientButton: LinearGradient {
        LinearGradient(colors: [.gradientTop, .gradientBottom], startPoint: .top, endPoint: .bottom)
    }
    
    var gradientButtonUnselected: LinearGradient {
        LinearGradient(colors: [.white.opacity(0.7), .white.opacity(0.6)], startPoint: .top, endPoint: .bottom)
    }
    
    var body: some View {
        VStack {
            switch selectedTab {
            case 0:
                SettingsView()
            case 1 :
                BatteryView()
            case 2:
                UnderDevelopmentView()
            case 3:
                UnderDevelopmentView()
            default:
                EmptyView()
                
                
            }
                
            
            
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .overlay {
            VStack {
                Spacer()
                TabBarBackgroundView()
                    .overlay {
                        HStack {
                            Button(action: {
                                withAnimation(.easeInOut(duration: 0.4)) {
                                    selectedTab = 0
                                }
                            }, label: {
                                Image(systemName: "car")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundStyle(selectedTab == 0 ? gradientButton : gradientButtonUnselected)
                                    .shadow(color: selectedTab == 0 ? .gradientTop : .clear, radius: 15)
                                    .shadow(color: selectedTab == 0 ? .gradientTop : .clear, radius: 10)
                                    .frame(width: 25, height: 25)
                                    .padding()
                            })

                            
                            Button(action: {
                                withAnimation(.easeInOut(duration: 0.4)) {
                                    selectedTab = 1
                                }
                            }, label: {
                                Image(systemName: "bolt.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundStyle(selectedTab == 1 ? gradientButton : gradientButtonUnselected)
                                    .shadow(color: selectedTab == 1 ? .gradientTop : .clear, radius: 15)
                                    .shadow(color: selectedTab == 1 ? .gradientTop : .clear, radius: 10)
                                    .frame(width: 25, height: 25)
                                    .padding()
                            })
                            
                            Spacer()
                                .frame(width: 90)
                            
                            Button(action: {
                                withAnimation(.easeInOut(duration: 0.4)) {
                                    selectedTab = 2
                                }
                            }, label: {
                                Image(systemName: "mappin.and.ellipse")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundStyle(selectedTab == 2 ? gradientButton : gradientButtonUnselected)
                                    .shadow(color: selectedTab == 2 ? .gradientTop : .clear, radius: 15)
                                    .shadow(color: selectedTab == 2 ? .gradientTop : .clear, radius: 10)
                                    .frame(width: 25, height: 25)
                                    .padding()
                            })

                            
                            Button(action: {
                                withAnimation(.easeInOut(duration: 0.4)) {
                                    selectedTab = 3
                                }
                            }, label: {
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundStyle(selectedTab == 3 ? gradientButton : gradientButtonUnselected)
                                    .shadow(color: selectedTab == 3 ? .gradientTop : .clear, radius: 15)
                                    .shadow(color: selectedTab == 3 ? .gradientTop : .clear, radius: 10)
                                    .frame(width: 25, height: 25)
                                    .padding()
                            })
                            
                            
                            
                        }
                    }
            }
            .padding(.bottom, -12)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

#Preview {
    TabBarView()
}
