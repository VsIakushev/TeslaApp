//
//  TemperatureTwisterView.swift
//  TeslaApp
//
//  Created by Vitaliy Iakushev on 14.05.2024.
//

import SwiftUI

struct TemperatureTwisterView: View {
    
    @Binding var temperature: Double
    @Binding var circleProgress: CGFloat
    @Binding var interfaceColor: Color
    
    @Binding var minTemperature: Double
    @Binding var maxTemperature: Double
    
    @Binding var isEnabled: Bool
    
    var body: some View {
        ZStack {
            Text("\(String(format: "%.0f", temperature))° C")
                .opacity(isEnabled ? 1 : 0)
                .font(.system(size: 30))
                .frame(width: 170, height: 170)
                .foregroundColor(.white.opacity(0.8))
                .bold()
                .background(
                    ZStack {
                        RadialGradient(colors: [.gray.opacity(0.4), .black.opacity(0.9)], center: .topLeading, startRadius: 200, endRadius: -20)
                        Circle()
                            .fill(LinearGradient(colors: [.gray.opacity(0.5), .black.opacity(0.9)], startPoint: .bottomTrailing, endPoint: .topLeading))
                            .padding(2)
                            .blur(radius: 4)
                            .clipShape(Circle())
                        Circle()
                            .stroke(style: StrokeStyle(lineWidth: 45))
                            .fill(LinearGradient(colors: [.black.opacity(0.7), .gray.opacity(0.3)], startPoint: .bottom, endPoint: .topLeading))
                    }
                )
                .clipShape(Circle())
                .shadow(color: .white.opacity(0.2), radius: 20, x: -15, y: -15)
                .shadow(color: .black.opacity(1), radius: 15, x: 10, y: 10)
                
            Circle()
                .trim(from: 0, to: calculateCircleProgress())
                .stroke(interfaceColor, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                .frame(width: 170)
                .rotationEffect(.degrees(-90))
                .shadow(color: interfaceColor, radius: 13)
                .opacity(isEnabled ? 1 : 0)
        }
    }
    
    private func calculateCircleProgress() -> CGFloat {
        let range = maxTemperature - minTemperature
        let degreeFraction = 1.0 / range
        if temperature > maxTemperature - 2 {
            return ((temperature - minTemperature) * degreeFraction) - 0.038
        } else {
            
            return ((temperature - minTemperature) * degreeFraction)
        }
    }
}

#Preview {
    TemperatureTwisterView(temperature: .constant(30), circleProgress: .constant(0.6), interfaceColor: .constant(.gradientTop), minTemperature: .constant(15), maxTemperature: .constant(30), isEnabled: .constant(true))
}
