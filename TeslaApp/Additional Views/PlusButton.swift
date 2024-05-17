//
//  PlusButton.swift
//  TeslaApp
//
//  Created by Vitaliy Iakushev on 17.05.2024.
//

import SwiftUI

struct PlusButton: View {
    var gradientButton: LinearGradient {
        LinearGradient(colors: [.gradientTop, .gradientBottom], startPoint: .top, endPoint: .bottom)
    }
    
    var body: some View {
        
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                
                Circle()
                    .foregroundColor(.appDarkShadow)
                    .shadow(color: .white.opacity(0.4), radius: 1, x: -1, y: -2)
                    .shadow(color: .black, radius: 1, x: 1, y: 1)
                    .frame(width: 68, height: 68)
                    .overlay {
                        Image(systemName: "plus")
                            .foregroundStyle(gradientButton)
                            .font(.system(size: 36))
                            .bold()
                    }
            })
    }
}

#Preview {
    PlusButton()
}
