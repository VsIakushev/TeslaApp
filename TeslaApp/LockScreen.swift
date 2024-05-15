//
//  LockScreen.swift
//  TeslaApp
//
//  Created by Vitaliy Iakushev on 13.05.2024.
//

import SwiftUI

struct LockScreen: View {
    
    @State private var isLocked = true
    @State private var isSettingsShown = false
    
    var gradientButton: LinearGradient {
        LinearGradient(colors: [.gradientTop, .gradientBottom], startPoint: .top, endPoint: .bottom)
    }
    
    var lockedGradient: LinearGradient {
        LinearGradient(colors: [.lockedTop, .black, .black, .lockedBottom], startPoint: .top, endPoint: .bottom)
    }
    
    var unlockedGradient: LinearGradient {
        LinearGradient(colors: [.unlockedTop, .unlockedBottom], startPoint: .top, endPoint: .bottom)
    }
    
    var carImage: some View {
        Image(isLocked ? "tsla" : "teslaWhite")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: UIScreen.main.bounds.width)
            .frame(height: 260)
        
            .shadow(color: isLocked ? .black : .black, radius: 40, x: 0, y: 0)
            .shadow(color: isLocked ? .black : .unlockedCarGradient, radius: 50, x: 0, y: -30)
            
    }
    
    var settingsButton: some View {
        Button {
            isSettingsShown.toggle()
        } label: {
            Image("gear")
                .padding(12)
                .padding(.top, 7)
                .neomorphismUnSelectedSphericButton()
                .neomorphismUnSelectedSperic()
        }
    }
    
    var welcomeLabelView: some View {
        VStack {
            Text("Hi")
                .foregroundColor(.white)
                .opacity(isLocked ? 0 : 0.7)
                .font(.title3)
            Text("Welcome Back")
                .foregroundColor(.white)
                .opacity(isLocked ? 0 : 1)
                .font(.title)
                .bold()
                .padding()
        }
    }
    
    var lockButtonView: some View {
        Button {
            withAnimation {
                isLocked.toggle()
            }
        } label: {
            ZStack {
                if isLocked {
                    RoundedRectangle(cornerRadius: 40)
                        .fill(isLocked ? .appBackground.opacity(0.2) : .appBackground)
                        .neomorphismUnSelectedStyle()
                        .frame(width: 180, height: 80)
                } else {
                    RoundedRectangle(cornerRadius: 40)
                        .fill(isLocked ? .black : .appBackground)
                        .neomorphismSelectedStyle()
                        .frame(width: 180, height: 80)
                }
                
                
                HStack {
                    Text(isLocked ? "Unlock" : "Lock")
                        .foregroundColor(.white)
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                        .padding(.leading, 30)
                    
                    Spacer()
                    Image(systemName: isLocked ? "lock.fill" : "lock.open.fill")
                        .padding()
                        .foregroundStyle(gradientButton)
                        .neomorphismUnSelectedSphericButton()
                        .neomorphismUnSelectedSperic()
                        .frame(width: 80, height: 80)
                }
                .frame(width: 180, height: 80)
            }
            .padding(.bottom, 100)
        }
    }
    
    var body: some View {
        ZStack {
            isLocked ? lockedGradient : unlockedGradient
            
            VStack {
                HStack {
                    Spacer()
                    settingsButton
                    .padding(20)
                    .padding(.trailing, 20)
                }
                .padding(.top,65)
                
                welcomeLabelView
                carImage
                Spacer()
                lockButtonView
            }
        }
        .fullScreenCover(isPresented: $isSettingsShown) {
            SettingsView()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    LockScreen()
}
