//
//  ContentView.swift
//  TeslaApp
//
//  Created by Vitaliy Iakushev on 13.05.2024.
//

import SwiftUI

/// Settings Screen
struct SettingsView: View {
    
    var body: some View {
        backgroundStackView {
            VStack {
                headerView
                carView
                controllPanelView
                Spacer()
                    .frame(height: 40)
                if tagSelected == 1 {
                    closedCarControllView
                }

                Spacer()
            }
            .fullScreenCover(isPresented: $showClimateSettings) {
                ClimateSettingsView()
                
            }
        }
    }
    
    @State private var tagSelected = 0
    @State private var isCarClose = false
    @State private var showClimateSettings = false
    
    private var unlockedGradient: LinearGradient {
        LinearGradient(colors: [.unlockedTop, .unlockedBottom], startPoint: .top, endPoint: .bottom)
    }
    
    private var headerView: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Tesla")
                    .font(.system(size: 28))
                    .bold()
                    .foregroundStyle(.white)
                HStack {
                    Image(systemName: "battery.50percent")
                    Text("187 km")
                }
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                    .opacity(0.4)
            }
            Spacer()
        }
        .padding(25)
    }
    
    private var carView: some View {
        Image(isCarClose ? "closeCar" : "closeCar")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: 150)
            .padding(.horizontal)
            .padding(.bottom, 40)
            .shadow(color: .white.opacity(0.5), radius: 15, x: 10, y: 10)
    }
    
    private var gradient: LinearGradient {
        LinearGradient(colors: [.gradientTop, .gradientBottom], startPoint: .bottom, endPoint: .top)
    }
    
    private var gradientButton: LinearGradient {
        LinearGradient(colors: [.gradientTop, .gradientBottom], startPoint: .top, endPoint: .bottom)
    }
    
    private var controllPanelView: some View {
        HStack (spacing: 30) {
            ForEach(1..<5) { index in
                Button {
                    withAnimation {
                        tagSelected = index
                        if tagSelected == 2 {
                            showClimateSettings.toggle()
                        }
                    }
                } label: {
                    Image("\(index)")
                        .frame(width: 20, height: 20)
                        .padding()
                        .neomorphismUnSelectedSphericButton()
                        .neomorphismUnSelectedSperic()
                        .overlay {
                            Circle()
                                .stroke(gradient, lineWidth: 2)
                                .opacity(tagSelected == index ? 1 : 0)
                        }
                }
                
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 50).fill(.appBackground))
        .neomorphismUnSelectedStyle()
    }
    
    private var closedCarControllView: some View {
        Button {
            isCarClose.toggle()
        } label: {
            HStack {
                Label {
                    Text(isCarClose ? "Close" : "Open")
                        .foregroundColor(.white.opacity(0.7))
                        .frame(width: 120)
                } icon: {
                    Image(systemName: isCarClose ? "lock.open.fill" : "lock.fill")
                        .padding()
                        .foregroundStyle(gradientButton)
                        .neomorphismUnSelectedSphericButton()
                        .neomorphismUnSelectedSperic()
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 50).fill(.appBackground))
            .overlay {
                RoundedRectangle(cornerRadius: 50)
                    .stroke(Color.appBackground.opacity(0.1), lineWidth: 10)
                    .shadow(color: .white.opacity(0.1), radius: 3, x: -5, y: -5)
                    .shadow(color: .black, radius: 3, x: 4, y: 5)
                    .shadow(color: .black, radius: 5, x: 4, y: 5)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
            }
        }
        .frame(width: 300)
    }
    
    private func backgroundStackView<Content: View>(content: ()->Content) -> some View {
        ZStack {
            Rectangle()
                .fill(LinearGradient(colors: [.unlockedTop, .unlockedBottom], startPoint: .top, endPoint: .bottom))
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                .ignoresSafeArea(.all)
            content()
        }
    }  
}

#Preview {
    SettingsView()
        .environment(\.colorScheme, .dark)
}
