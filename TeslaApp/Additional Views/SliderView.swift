//
//  SliderView.swift
//  TeslaApp
//
//  Created by Vitaliy Iakushev on 14.05.2024.
//

import SwiftUI

struct sliderView: View {
    @Binding var value: Double
    @Binding var minSliderValue: Double
    @Binding var maxSliderValue: Double
    @Binding var isEnabled: Bool
    @Binding var interfaceColor: Color
    
    @State private var sliderWidth: CGFloat = 182
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
            Capsule()
                .fill(LinearGradient(colors: [.unlockedTop, .unlockedBottom], startPoint: .bottom, endPoint: .top))
                .frame(width: sliderWidth, height: 8)
            
            Capsule()
                .fill(LinearGradient(colors: [interfaceColor.opacity(0.5), interfaceColor], startPoint: .top, endPoint: .bottom))
                .frame(width: calculateOffset(), height: 8)
                .opacity(isEnabled ? 1 : 0)
            
            Image("slider")
                .offset(x: calculateOffset() - 12)
                .shadow(color: .white.opacity(0.05), radius: 5, x: -3, y: -3)
                .shadow(color: .black.opacity(0.15), radius: 5, x: 3, y: 3)
                .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { value in
                        let percentage = value.location.x / sliderWidth
                        let newValue = percentage * (maxSliderValue - minSliderValue) + minSliderValue
                        self.value = min(max(newValue, minSliderValue), maxSliderValue)
                    }
                ).disabled(!isEnabled)
        }
    }
    
    private func calculateOffset() -> CGFloat {
       return CGFloat((value - minSliderValue) / (maxSliderValue - minSliderValue) * sliderWidth)
        
    }
}
