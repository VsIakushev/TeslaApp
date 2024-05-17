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
    @State private var showLoadingScreen = true
    
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
            .offset(y: isLocked ? 0 : 30)
        
            .shadow(color: isLocked ? .black : .black, radius: 40, x: 0, y: 0)
            .shadow(color: isLocked ? .black : .unlockedCarGradient.opacity(0.5), radius: 50, x: 0, y: -15)
            
    }
    
    var settingsButton: some View {
        Button {
            withAnimation(.easeOut(duration: 1)) {
                isSettingsShown.toggle()
            }
        } label: {
            Image("gear")
                .padding()
                .neomorphismUnSelectedSphericButton()
                .neomorphismUnSelectedSperic()
        }
    }
    
    var welcomeLabelView: some View {
        VStack {
            Text("Hi, Vitalii")
                .foregroundColor(.white)
                .opacity(isLocked ? 0 : 0.7)
                .font(.title3)
                .bold()
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
            withAnimation(.easeOut(duration: 1.5)) {
                isLocked.toggle()
            }
        } label: {
            ZStack {
                
                if isLocked {
                    RoundedRectangle(cornerRadius: 40)
                        .fill(isLocked ? .appBackground.opacity(0.3) : .appBackground)
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
                        .foregroundColor(.white.opacity(0.7))
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
            
            if showLoadingScreen {
                LoadingView()
            } else {
                
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
            
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.6) {
                withAnimation(.easeOut(duration: 3)) {
                    showLoadingScreen = false
                }
            }
        }
        .fullScreenCover(isPresented: $isSettingsShown) {
            TabBarView()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    LockScreen()
}
