//
//  LockScreen.swift
//  TeslaApp
//
//  Created by Vitaliy Iakushev on 13.05.2024.
//

import SwiftUI

/// Application Lock Screen
struct LockScreen: View {
    
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
    
    @State private var isLocked = true
    @State private var isSettingsShown = false
    @State private var showLoadingScreen = true
    
    private var gradientButton: LinearGradient {
        LinearGradient(colors: [.gradientTop, .gradientBottom], startPoint: .top, endPoint: .bottom)
    }
    
    private var lockedGradient: LinearGradient {
        LinearGradient(colors: [.lockedTop, .black, .black, .lockedBottom], startPoint: .top, endPoint: .bottom)
    }
    
    private var unlockedGradient: LinearGradient {
        LinearGradient(colors: [.unlockedTop, .unlockedBottom], startPoint: .top, endPoint: .bottom)
    }
    
    private var carImage: some View {
        Image(isLocked ? "tsla" : "teslaWhite")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: UIScreen.main.bounds.width)
            .frame(height: 260)
            .offset(y: isLocked ? 0 : 30)
        
            .shadow(color: isLocked ? .black : .black.opacity(0.5), radius: 40, x: 0, y: 0) 
    }
    
    private var settingsButton: some View {
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
    
    private var welcomeLabelView: some View {
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
    
    private var lockButtonView: some View {
        Button {
            withAnimation(.easeOut(duration: 1.5)) {
                isLocked.toggle()
            }
        } label: {
            ZStack {
                
                if isLocked {
                    RoundedRectangle(cornerRadius: 40)
                        .fill(.appBackground.opacity(0.3))
                        .neomorphismUnSelectedStyle()
                        .frame(width: 180, height: 80)
                } else {
                    RoundedRectangle(cornerRadius: 40)
                        .fill(.appBackground)
                        .frame(width: 180, height: 80)
                        .overlay {
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color.appBackground.opacity(0.1), lineWidth: 10)
                                .shadow(color: .white.opacity(0.1), radius: 3, x: -5, y: -5)
                                .shadow(color: .black, radius: 3, x: 4, y: 5)
                                .shadow(color: .black, radius: 5, x: 4, y: 5)
                                .clipShape(RoundedRectangle(cornerRadius: 50))
                        }
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
}

#Preview {
        LockScreen()
}
