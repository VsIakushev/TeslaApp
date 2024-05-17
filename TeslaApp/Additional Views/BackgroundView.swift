//
//  BackgroundView.swift
//  TeslaApp
//
//  Created by Vitaliy Iakushev on 14.05.2024.
//

import SwiftUI

/// Background view for all Screens, exept Locked Screen
struct BackgroundView: View {
    var body: some View {
        Rectangle()
            .fill(LinearGradient(colors: [.unlockedTop, .unlockedBottom], startPoint: .top, endPoint: .bottom))
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            .ignoresSafeArea(.all)
    }
}
