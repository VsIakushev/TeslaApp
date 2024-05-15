//
//  ContentView.swift
//  TeslaApp
//
//  Created by Vitaliy Iakushev on 13.05.2024.
//

import SwiftUI

struct SettingsView: View {
    
    @State var tagSelected = 0
    @State var isCarClose = false
    
    @State private var showClimateSettings = false
    
    func backgroundStackView<Content: View>(content: ()->Content) -> some View {
        ZStack {
            Rectangle()
                .fill(LinearGradient(colors: [.unlockedTop, .unlockedBottom], startPoint: .top, endPoint: .bottom))
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                .ignoresSafeArea(.all)
            content()
        }
    }
    var unlockedGradient: LinearGradient {
        LinearGradient(colors: [.unlockedTop, .unlockedBottom], startPoint: .top, endPoint: .bottom)
    }
    
    var headerView: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Tesla")
                    .font(.system(size: 28))
                    .bold()
                    .foregroundStyle(.white)
                Text("187 km")
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                    .opacity(0.4)
            }
            Spacer()
        }
        .padding(25)
    }
    
    var carView: some View {
        Image(isCarClose ? "closeCar" : "closeCar")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: 150)
            .padding(.horizontal)
            .padding(.bottom, 40)
            .shadow(color: .white.opacity(0.5), radius: 15, x: 10, y: 10)
    }
    
    var gradient: LinearGradient {
        LinearGradient(colors: [.gradientTop, .gradientBottom], startPoint: .bottom, endPoint: .top)
    }
    
    var controllPanelView: some View {
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
    
    var closedCarControllView: some View {
        Button {
            isCarClose.toggle()
        } label: {
            HStack {
                Label {
                    Text(isCarClose ? "Close" : "Open")
                        .foregroundColor(.white)
                        .frame(width: 120)
                } icon: {
                    Image(systemName: isCarClose ? "lock.open.fill" : "lock.fill")
                        .renderingMode(.template)
                        .neomorphismUsSelectedCircleStyle()
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 50).fill(.appBackground))
            .neomorphismSelectedStyle()
        }
        .frame(width: 300)
    }
    
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
}

#Preview {
    SettingsView()
        .environment(\.colorScheme, .dark)
}
