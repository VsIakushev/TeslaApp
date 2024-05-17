//
//  BottomSheetView.swift
//  TeslaApp
//
//  Created by Vitaliy Iakushev on 14.05.2024.
//

import SwiftUI

struct BottomSheetView: View {
    @GestureState private var gestureOffset = CGSize.zero
    @State private var currentMenuOffsetY: CGFloat = 0.0
    @State private var lastMenuOffsetY: CGFloat = 0.0
    
    @Binding var isAcOn: Bool
    @Binding var color: Color
    @Binding var temperature: Double
    @Binding var minTemperature: Double
    @Binding var maxTemperature: Double
    
    var dragGesture: some Gesture {
        DragGesture()
            .updating($gestureOffset) { value, state, transaction in
                state = value.translation
                onChangeMenuOffset()
            }
            .onEnded { value in
                let maxHeight: CGFloat = 130
                withAnimation {
                    if -currentMenuOffsetY > maxHeight / 2 {
                        currentMenuOffsetY = -maxHeight
                    } else {
                        currentMenuOffsetY = 0
                    }
                    lastMenuOffsetY = currentMenuOffsetY
                }
            }
    }
    
    private func onChangeMenuOffset() {
        DispatchQueue.main.async {
            currentMenuOffsetY = gestureOffset.height + lastMenuOffsetY
        }
    }
    
    
    var body: some View {
        VStack {
            Capsule()
                .fill(.black.opacity(0.9))
                .frame(width: 80, height: 4)
                .padding(.top, 10)
            
            HStack {
                VStack(alignment: .leading) {
                    Text(isAcOn ? "A/C is ON" : "A/C is OFF")
                        .foregroundColor(.white.opacity(0.8))
                        .bold()
                    Text(isAcOn ? "Tap to turn off or swipe up for a fast setup" : "Tap to turn on or swipe up for a fast setup")
                        .foregroundColor(.white.opacity(0.5))
                }
                .padding()
                Spacer()
                    .frame(width: 60)
                
                Button {
                    withAnimation {
                        isAcOn.toggle()
                    }
                } label: {
                    Image(systemName: "power")
                        .foregroundColor(.white)
                        .padding(20)
                        .background(
                            ZStack {
                                RadialGradient(colors: [.white.opacity(1), .blue], center: .bottomTrailing, startRadius: -10, endRadius: 60)
                                Circle()
                                    .fill(LinearGradient(colors: [.white.opacity(0.1), .buttonBlue.opacity(0.95)], startPoint: .bottomTrailing, endPoint: .topLeading))
                                    .padding(2)
                                    .blur(radius: 4)
                                Circle()
                                    .stroke(style: StrokeStyle(lineWidth: 4))
                                    .fill(LinearGradient(colors: [.blue.opacity(0.9), .white.opacity(0.6)], startPoint: .bottom, endPoint: .topLeading))
                            }
                        )
                        .clipShape(Circle())
                }
                .neomorphismUnSelectedSperic()
                .padding(.trailing, 20)
            }
            .padding(.top, -10)
            
            
            HStack {
                ColorPicker("", selection: $color)
                .frame(width: 40)
                Spacer()
                
                Button {
                    withAnimation {
                        if temperature > minTemperature {
                            temperature -= 1
                        }
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white.opacity(0.8))
                        .bold()
                }
                .disabled(!isAcOn)
                .padding(.horizontal)

                
                Text("\(String(format: "%.0f", temperature))°")
                    .font(.system(size: 30))
                    .foregroundColor(.white.opacity(0.8))
                    .bold()
                
                Button {
                    withAnimation {
                        if temperature < maxTemperature - 0.500001 {
                            temperature += 1
                        }
                    }
                } label: {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.white.opacity(0.8))
                        .bold()
                }
                .disabled(!isAcOn)
                .padding(.horizontal)
                
                Spacer()
                Image("window")
                    .padding(.trailing)
                
            }
            .padding(.horizontal)
            
            HStack {
                Text("On")
                    .foregroundColor(.white.opacity(0.8))
                Spacer()
                Text("Vent")
                    .foregroundColor(.white.opacity(0.8))
            }
            .padding(.horizontal, 30)
            .padding(.vertical)
            
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 250)
        .background(RoundedRectangle(cornerRadius: 45).fill(.unlockedTop))
        .ignoresSafeArea(.all, edges: .bottom)
        .offset(y: UIScreen.main.bounds.height)
        .offset(y: currentMenuOffsetY)
        .gesture(dragGesture)
        .opacity(0.9)
    }
    
}
