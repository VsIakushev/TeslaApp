//
//  BatteryView.swift
//  TeslaApp
//
//  Created by Vitaliy Iakushev on 16.05.2024.
//

import SwiftUI

struct BatteryView: View {
    
    struct BatteryShape: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY * 0.6))
            path.addLine(to: CGPoint(x: rect.maxX * 0.05, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX * 0.95, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY * 0.6))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.closeSubpath()
            return path
        }
    }
    
    @Binding var progress: CGFloat
    
    var body: some View {
        BatteryShape()
            .stroke(.gray.opacity(0.3), style: StrokeStyle(lineWidth: 1))
            .fill(LinearGradient(colors: [
                .white.opacity(0.4),
                .white.opacity(0.3),
                .white.opacity(0.1),
                .white.opacity(0.3),
            ], startPoint: .top, endPoint: .bottom))
            .frame(width: 273, height: 40)
            .shadow(color: .white.opacity(0.4), radius: 4, y: -3)
            .shadow(color: .black.opacity(0.4), radius: 4, x: 3, y: 3)
            .overlay {
                // Заливка цветом
                BatteryShape()
                    .fill(LinearGradient(colors: [
                        .gradientTop.opacity(0.9),
                        .gradientTop.opacity(0.9),
                        .gradientTop.opacity(0.7),
                        .gradientBottom.opacity(0.9)], startPoint: .top, endPoint: .bottom))
                    .frame(width: 273, height: 42)
                    .mask {
                        GeometryReader { geometry in
                            BatteryShape()
                                .frame(width: geometry.size.width * progress, height:  geometry.size.height)
                                .blur(radius: 2)
                        }
                    }
                
                // Тень
                Rectangle()
                    .fill(LinearGradient(colors: [
                        .gradientTop.opacity(0.5),
                        .gradientMid.opacity(0.5),
                        .cyan.opacity(0.2),
                        .clear], startPoint: .bottom, endPoint: .top))
                    .frame(width: 273, height: 100)
                    .mask(
                        GeometryReader { geometry in
                            Rectangle()
                                .frame(width: geometry.size.width * progress, height: 100)
                                .opacity(0.6)
                        }
                    )
                    .offset(y: -50)
                    .blur(radius: 8)
            }
    }
}


#Preview {
    BatteryView(progress: .constant(0.6))
}


