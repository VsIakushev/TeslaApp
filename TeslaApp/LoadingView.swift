//
//  LoadingView.swift
//  TeslaApp
//
//  Created by Vitaliy Iakushev on 16.05.2024.
//

import SwiftUI

struct LoadingView: View {
    
    @State var progress: CGFloat = 0.0
    @State var whiteShadowisShown = false
    @State var showView = false
    
    var body: some View {
        ZStack {
            if showView {
                BackgroundView()
                ZStack {
                    if whiteShadowisShown {
                        triangleSHadow()
                            .fill(.white.opacity(0.3))
                            .blur(radius: 20)
                            .shadow(color: .white.opacity(0.4), radius: 20, y: -55)
                        
                    }
                    
                    Group {
                        topLineShadowLeft()
                            .trim(from: 0, to: progress)
                            .stroke(.gradientTop, style: StrokeStyle(lineWidth: 5))
                        
                        
                        topLineShadowRight()
                            .trim(from: 0, to: progress)
                            .stroke(.gradientTop, style: StrokeStyle(lineWidth: 5))
                        
                        bottomLineShadowLeft()
                            .trim(from: 0, to: progress)
                            .stroke(.gradientTop, style: StrokeStyle(lineWidth: 5))
                        
                        bottomLineShadowRight()
                            .trim(from: 0, to: progress)
                            .stroke(.gradientTop, style: StrokeStyle(lineWidth: 5))
                        
                    }
                    .shadow(color: .gradientTop, radius: 5)
                    .blur(radius: 8.0)
                    
                    
                    topLine()
                        .fill(Color.black.opacity(0.4))
                        .shadow(color: .white.opacity(0.3), radius: 4, x: -3, y: -3)
                        .shadow(color: .black, radius: 4, x: 5, y: 5)
                    
                    
                    bottomLine()
                        .fill(Color.black.opacity(0.4))
                        .shadow(color: .white.opacity(0.3), radius: 7, x: -5, y: -5)
                        .shadow(color: .black, radius: 7, x: 5, y: 5)
                        .blur(radius: 0.5)
                    
                    
                }
                .frame(width: 360, height: 360)
                .padding()
            } else {
                Color.black
            }
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 1.5)) {
                showView = true
            }
            
            withAnimation(.easeInOut(duration: 1.5).delay(1.5)) {
                progress = 1
            }
            withAnimation(.easeIn(duration: 0.07).delay(3)) {
                whiteShadowisShown = true
            }
            withAnimation(.linear(duration: 1.5).delay(3.05)) {
                whiteShadowisShown = false
            }
            withAnimation(.easeInOut(duration: 1.5).delay(4.3)) {
                showView = false
            }
        }
    }
}

#Preview {
    LoadingView()
}

struct TeslaRoundedBottomRectangleView: Shape {
    var curveOffset: CGFloat = -100
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.maxX, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.maxY), control: CGPoint(x: rect.width / 2, y: rect.maxY + curveOffset))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        path.closeSubpath()
        
        return path
    }
}

struct topLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY +  37))
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.minY + 37), control: CGPoint(x: rect.midX, y: rect.minY - 32))
        path.addLine(to: CGPoint(x: rect.maxX - 11, y: rect.minY + 56))
        path.addQuadCurve(to: CGPoint(x: rect.minX + 11, y: rect.minY + 56), control: CGPoint(x: rect.midX, y: rect.minY - 12))
        path.closeSubpath()
        
        return path
    }
}



struct bottomLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX + 17, y: rect.minY + 68))
        
        path.addQuadCurve(to: CGPoint(x: rect.midX - 37, y: rect.minY + 35), control: CGPoint(x: rect.midX / 2, y: rect.minY + 37))
        path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.minY + 80), control: CGPoint(x: rect.midX - 20, y: rect.minY + 70))
        path.addQuadCurve(to: CGPoint(x: rect.midX + 37, y: rect.minY + 35), control: CGPoint(x: rect.midX + 20, y: rect.minY + 70))
        
        path.addQuadCurve(to: CGPoint(x: rect.maxX - 17, y: rect.minY + 68), control: CGPoint(x: rect.midX + (rect.midX / 2), y: rect.minY + 37))
        path.addQuadCurve(to: CGPoint(x: rect.maxX - 63, y: rect.minY + 102), control: CGPoint(x: rect.maxX - 30, y: rect.minY + 90))
        path.addQuadCurve(to: CGPoint(x: rect.midX + 50, y: rect.minY + 77), control: CGPoint(x: rect.midX + 115, y: rect.minY + 70))
        path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.maxY), control: CGPoint(x: rect.midX + 15, y: rect.midY))
        path.addQuadCurve(to: CGPoint(x: rect.midX - 50, y: rect.minY + 77), control: CGPoint(x: rect.midX - 15, y: rect.midY))
        path.addQuadCurve(to: CGPoint(x: rect.minX + 63, y: rect.minY + 102), control: CGPoint(x: rect.midX - 115, y: rect.minY + 70))
        path.addQuadCurve(to: CGPoint(x: rect.minX + 17, y: rect.minY + 68), control: CGPoint(x: rect.minX + 30, y: rect.minY + 90))
        
        
        path.closeSubpath()
        
        return path
    }
}


struct topLineShadowLeft: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY + 2))
        path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.minY + 37), control: CGPoint(x: rect.midX / 2, y: rect.minY + 2 ))
        path.addLine(to: CGPoint(x: rect.minX + 11, y: rect.minY + 56))
        path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.minY + 22), control: CGPoint(x: rect.midX / 2, y: rect.minY + 23 ))
        
        return path
    }
}

struct topLineShadowRight: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY + 2))
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.minY + 37), control: CGPoint(x: rect.maxX * 0.75, y: rect.minY + 2 ))
        path.addLine(to: CGPoint(x: rect.maxX - 11, y: rect.minY + 56))
        path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.minY + 22), control: CGPoint(x: rect.maxX * 0.75, y: rect.minY + 23 ))
        
        return path
    }
}

struct bottomLineShadowRight: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY + 80))
        
        path.addQuadCurve(to: CGPoint(x: rect.midX + 37, y: rect.minY + 35), control: CGPoint(x: rect.midX + 20, y: rect.minY + 70))
        
        path.addQuadCurve(to: CGPoint(x: rect.maxX - 17, y: rect.minY + 68), control: CGPoint(x: rect.midX + (rect.midX / 2), y: rect.minY + 37))
        path.addQuadCurve(to: CGPoint(x: rect.maxX - 63, y: rect.minY + 102), control: CGPoint(x: rect.maxX - 30, y: rect.minY + 90))
        path.addQuadCurve(to: CGPoint(x: rect.midX + 50, y: rect.minY + 77), control: CGPoint(x: rect.midX + 115, y: rect.minY + 70))
        
        path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.maxY), control: CGPoint(x: rect.midX + 15, y: rect.midY))
        
        return path
    }
}

struct bottomLineShadowLeft: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY + 80))
        path.addQuadCurve(to: CGPoint(x: rect.midX - 37, y: rect.minY + 35), control: CGPoint(x: rect.midX - 20, y: rect.minY + 70))
        path.addQuadCurve(to: CGPoint(x: rect.minX + 17, y: rect.minY + 68), control: CGPoint(x: rect.midX / 2, y: rect.minY + 37))
        path.addQuadCurve(to: CGPoint(x: rect.minX + 63, y: rect.minY + 102), control: CGPoint(x: rect.minX + 30, y: rect.minY + 90))
        path.addQuadCurve(to: CGPoint(x: rect.midX - 50, y: rect.minY + 77), control: CGPoint(x: rect.midX - 115, y: rect.minY + 70))
        
        path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.maxY), control: CGPoint(x: rect.midX - 15, y: rect.midY))
        
        return path
    }
}

struct triangleSHadow: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY +  37))
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.minY + 37), control: CGPoint(x: rect.midX, y: rect.minY - 32))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.closeSubpath()
        
        return path
    }
}
