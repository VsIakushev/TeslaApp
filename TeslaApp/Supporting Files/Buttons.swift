////
////  ButtonsTests.swift
////  TeslaApp
////
////  Created by Vitaliy Iakushev on 13.05.2024.
////
//
import SwiftUI


struct ButtonsTests: View {
    
    @State private var temperature = 15.0
    @State private var circleProgress: CGFloat = 1.0
    @State private var progressColor: Color = .gradientTop
    
    @State var minTemperature = 15.0
    @State var maxTemperature = 30.0
    
//    @State var sliderOffset: CGFloat = 40
    
    var temperatureLevel: some View {
        ZStack {
            Text("\(String(format: "%.0f", temperature))° C")
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
                .trim(from: 0, to: 0.7)
                .stroke(.cyan, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                .frame(width: 170)
                .rotationEffect(.degrees(-90))
                .shadow(color: .cyan, radius: 13)
        }
    }
    
    @State var tagSelected = 0
    
    var gradient: LinearGradient {
        LinearGradient(colors: [.gradientTop, .gradientBottom], startPoint: .bottom, endPoint: .top)
    }
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.unlockedTop, .unlockedBottom], startPoint: .top, endPoint: .bottom)
            VStack {
                TemperatureTwisterView(temperature: $temperature, circleProgress: $circleProgress, progressColor: $progressColor, minTemperature: $minTemperature, maxTemperature: $maxTemperature, isEnabled: .constant(true))
                Spacer().frame(height: 60)
                
                sliderView(value: $temperature, minSliderValue: $minTemperature, maxSliderValue: $maxTemperature, isEnabled: .constant(true))
                
            }
            
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ButtonsTests()
}
