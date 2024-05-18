//
//  PlusButton.swift
//  TeslaApp
//
//  Created by Vitaliy Iakushev on 17.05.2024.
//

import SwiftUI

/// Plus Button for TabBar
struct PlusButton: View {
    
    var body: some View {
        
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                
                Circle()
                    .foregroundColor(.appBackground)
                    .shadow(color: .white.opacity(0.3), radius: 3, x: -0, y: -2)
                    .shadow(color: .black, radius: 2, x: 2, y: 2)
                    .frame(width: 68, height: 68)
                    .overlay {
                        Image(systemName: "plus")
                            .foregroundStyle(gradientButton)
                            .font(.system(size: 36))
                            .bold()
                            .shadow(color: .gradientTop.opacity(0.3), radius: 9, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                    }
            })
    }
    
    private var gradientButton: LinearGradient {
        LinearGradient(colors: [.gradientTop, .gradientBottom], startPoint: .top, endPoint: .bottom)
    }
}

#Preview {
    PlusButton()
}
