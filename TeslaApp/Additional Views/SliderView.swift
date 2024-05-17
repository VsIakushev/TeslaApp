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

struct batterySliderView: View {
    @Binding var value: CGFloat
    @State private var minSliderValue: Double = 0
    @State private var maxSliderValue: Double = 1
    
    @State private var sliderWidth: CGFloat = 270
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
            Capsule()
                .fill(LinearGradient(colors: [.unlockedTop, .white.opacity(0.3)], startPoint: .top, endPoint: .bottom))
                .frame(width: sliderWidth, height: 9)
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 18)
                .foregroundStyle(LinearGradient(colors: [.gradientTop, .gradientBottom], startPoint: .top, endPoint: .bottom))
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
                )
        }
    }
    
    private func calculateOffset() -> CGFloat {
       return CGFloat((value - minSliderValue) / (maxSliderValue - minSliderValue) * sliderWidth)
        
    }
}

#Preview {
    VStack {
        
        sliderView(value: .constant(17), minSliderValue: .constant(10), maxSliderValue: .constant(20), isEnabled: .constant(true), interfaceColor: .constant(.cyan))
        batterySliderView(value: .constant(0.3))
    }
}
