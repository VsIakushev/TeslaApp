//
//  TabBarBackgroundView.swift
//  TeslaApp
//
//  Created by Vitaliy Iakushev on 16.05.2024.
//

import SwiftUI

#Preview {
    TabBarBackgroundView()
        .background(.white)
    
}
/// Custum shaped view for Tabbar's background
struct TabBarBackgroundView: View {
    
    var body: some View {

        ZStack {
            GeometryReader { proxy in

                let maxX = proxy.frame(in: .local).maxX
                let maxY = proxy.frame(in: .local).maxY
                let minX = proxy.frame(in: .local).minX
                
                Path { path in
                    path.move(to: CGPoint(x: minX, y: maxY))
                    path.addLine(to: CGPoint(x: minX, y: maxY * 0.45))
                    path.addCurve(to: CGPoint(x: maxX * 0.15, y: maxY * 0.12), control1: CGPoint(x: maxX * 0.07, y: maxY * 0.15), control2: CGPoint(x: maxX * 0.08, y: maxY * 0.14))
                    path.addLine(to: CGPoint(x: maxX * 0.29, y: maxY * 0.12))
                    path.addQuadCurve(to: CGPoint(x: maxX * 0.41, y: maxY * 0.32), control: CGPoint(x: maxX * 0.35, y: maxY * 0.12))
                    path.addQuadCurve(to: CGPoint(x: maxX * 0.59, y: maxY * 0.32), control: CGPoint(x: maxX * 0.5, y: maxY * 0.56))
                    path.addQuadCurve(to: CGPoint(x: maxX * 0.71, y: maxY * 0.12), control: CGPoint(x: maxX * 0.65, y: maxY * 0.12))
                    path.addLine(to: CGPoint(x: maxX * 0.85, y: maxY * 0.12))
                    path.addCurve(to: CGPoint(x: maxX, y: maxY * 0.45), control1: CGPoint(x: maxX * 0.92, y: maxY * 0.15), control2: CGPoint(x: maxX * 0.93, y: maxY * 0.14))
                    path.addQuadCurve(to: CGPoint(x: maxX, y: maxY * 0.45), control: CGPoint(x: maxX * 0.92, y: maxY * 0.1))
                    path.addLine(to: CGPoint(x: maxX, y: maxY))
                    path.closeSubpath()
                }
                .foregroundColor(.black.opacity(0.9))
                .shadow(color: .white.opacity(0.15), radius: 2, x: -1, y: -2)
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: 100)
        .edgesIgnoringSafeArea(.bottom)
    }
}
