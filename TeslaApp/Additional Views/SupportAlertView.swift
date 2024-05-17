//
//  SupportAlertView.swift
//  TeslaApp
//
//  Created by Vitaliy Iakushev on 16.05.2024.
//

import SwiftUI

struct SupportAlertView: View {
    @Binding var showAlert: Bool
    
    var body: some View {
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
                        showAlert = false
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
}

