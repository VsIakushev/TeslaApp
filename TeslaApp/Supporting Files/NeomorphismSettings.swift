//
//  NeomorphismSettings.swift
//  TeslaApp
//
//  Created by Vitaliy Iakushev on 14.05.2024.
//

import SwiftUI

/// Для самой сферической кнопки
struct NeomorphismUnSelectedSphericButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                ZStack {
                    RadialGradient(colors: [.gray, .black], center: .topLeading, startRadius: -10, endRadius: 90)
                    Circle()
                        .fill(LinearGradient(colors: [.gray.opacity(0.25), .black.opacity(0.45)], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .padding(2)
                        .blur(radius: 4)
                    Circle()
                        .stroke(style: StrokeStyle(lineWidth: 4))
                        .fill(LinearGradient(colors: [.black.opacity(0.5), .gray.opacity(0.3)], startPoint: .top, endPoint: .bottomTrailing))
                }
            )
            .clipShape(Circle())
    }
}
/// Для фона вокруг сферической кнопки
struct NeomorphismUnSelectedSperic: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .white.opacity(0.2), radius: 7, x: -3, y: -3)
            .shadow(color: .black.opacity(1), radius: 7, x: 7, y: 7)
    }
}

struct NeomorphismUnSelected: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .appLightShadow, radius: 5, x: -5, y: -5)
            .shadow(color: .appDarkShadow, radius: 5, x: 5, y: 5)
    }
}

struct NeomorphismSelected: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .lightShadow, radius: 5, x: 5, y: 5)
            .shadow(color: .darkShadow, radius: 5, x: -5, y: -5)
    }
}

struct NeomorphismUnSelectedCircle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .background(Circle().fill(.appBackground))
            .neomorphismUnSelectedStyle()
    }
}

extension View {
    /// Для фона вокруг сферической кнопки
    func neomorphismUnSelectedSperic() -> some View {
        modifier(NeomorphismUnSelectedSperic())
    }
    
    /// Для самой сферической кнопки
    func neomorphismUnSelectedSphericButton() -> some View {
        modifier(NeomorphismUnSelectedSphericButton())
    }
    
    func neomorphismUnSelectedStyle() -> some View {
        modifier(NeomorphismUnSelected())
    }
    
    func neomorphismSelectedStyle() -> some View {
        modifier(NeomorphismSelected())
    }
    
    func neomorphismUsSelectedCircleStyle() -> some View {
        modifier(NeomorphismUnSelectedCircle())
    }
}
