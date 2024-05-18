//
//  InDevelopingView.swift
//  TeslaApp
//
//  Created by Vitaliy Iakushev on 16.05.2024.
//

import SwiftUI

/// Stub for Screens under development
struct UnderDevelopmentView: View {
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                Text("This screen is under Development")
                    .font(.title3)
                    .bold()
                .padding()
                .foregroundColor(.white.opacity(0.8))
                
                Text("We appreciate your patience")
                    .foregroundColor(.white.opacity(0.6))
            }
        }
    }
}


#Preview {
    UnderDevelopmentView()
}
