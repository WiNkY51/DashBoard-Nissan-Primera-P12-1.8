//
//  DashboardView.swift
//  AnimatedDashboard
//
//  Created by Winky51 on 09.11.2024.
//

import SwiftUI

struct DashboardView: View {
    var temperature: Double
    var tachometerRotation: Double
    var speed: Double
    var fuel: Double
    var ignitionIsOn: Bool
    var engineIsOn: Bool
    var opacity: Double
    var body: some View {
        GeometryReader { geo in
            let width = geo.size.width
            let height = geo.size.height
            let size = min(width, height)
            let middle = size / 2
            let step = size / 10
            
            ZStack{
                Path { path in
                    path.move(to: CGPoint(x: step * 1.5, y: step * 3.8))
                    path.addQuadCurve(
                        to: CGPoint(x: step * 8.5, y: step * 3.8),
                        control: CGPoint(x: middle, y: step * 2)
                    )
                    path.addQuadCurve(
                        to: CGPoint(x: step * 8, y: middle),
                        control: CGPoint(x: size * 1.09, y: middle)
                    )
                    path.addLine(to: CGPoint(x: step * 2, y: middle))
                    path.addQuadCurve(
                        to: CGPoint(x: step * 1.5, y: step * 3.8),
                        control: CGPoint(x: -size * 0.09  , y: middle)
                    )
                }
                .foregroundStyle(.black)
                
//                .stroke(.black)
                                .frame(width: size, height: size)
                
                Path { path in
                    path.move(to: CGPoint(x: step, y: middle))
                    path.addLine(to: CGPoint(x: step * 9, y: middle))
                    path.move(to: CGPoint(x: middle, y: middle))
                    path.addLine(to: CGPoint(x: middle, y: step * 3.5))
                }
//                .stroke()
                ColantView(currentAnglePointer: temperature)
                    .frame(width: size * 0.1, height: size * 0.1)
                    .offset(x: -size * 0.26, y: -size * 0.07)
                    .opacity(opacity)
                    .animation(.linear(duration: 0.7), value: ignitionIsOn)
                
                SpeedometerView(currentAnglePointer: speed)
                    .frame(width: size * 0.17, height: size * 0.17)
                    .offset(x: -size * 0.11, y: -size * 0.09)
                    .opacity(opacity)
                    .animation(.linear(duration: 0.7), value: ignitionIsOn)
                
                TachometerView(currentAnglePointer: tachometerRotation)
                    .frame(width: size * 0.17, height: size * 0.17)
                    .offset(x: size * 0.11, y: -size * 0.09)
                    .opacity(opacity)
                    .animation(.linear(duration: 0.7), value: ignitionIsOn)
                
                FuelLevelView(fuelLevel: fuel)
                    .frame(width: size * 0.1, height: size * 0.1)
                    .offset(x: size * 0.26, y: -size * 0.07)
                    .opacity(opacity)
                    .animation(.linear(duration: 0.7), value: ignitionIsOn)
                    
                
                HardBraceIndicatorView()
                    .frame(width: size * 0.04, height: size * 0.04)
                    .offset(x: 0, y: -size * 0.15)
                    .opacity(speed == 0 && ignitionIsOn  ? 1 : 0)
                
                ABSView()
                    .frame(width: size * 0.04, height: size * 0.04)
                    .offset(x: 0, y: -size * 0.12)
                    .opacity(ignitionIsOn && !engineIsOn ? 1 : 0)
                    .animation(.default, value: engineIsOn)
                
                ChargeLevelView()
                    .frame(width: size * 0.03, height: size * 0.03)
                    .offset(x: 0, y: -size * 0.03)
                    .opacity(ignitionIsOn && !engineIsOn ? 1 : 0)
                    .animation(.default.delay(1), value: engineIsOn)
                
                CheckEngineView()
                    .frame(width: size * 0.025, height: size * 0.025)
                    .offset(x: middle * 0.45, y: -size * 0.14)
                    .opacity(ignitionIsOn && !engineIsOn ? 1 : 0)
                    .animation(.default.delay(1), value: engineIsOn)
                
                OilPresureView()
                    .frame(width: size * 0.029, height: size * 0.029)
                    .offset(x: -middle * 0.42, y: -size * 0.13)
                    .opacity(ignitionIsOn && !engineIsOn ? 1 : 0)
                    .animation(.default.delay(0.5), value: engineIsOn)
                
                LightIndicatorView()
                    .frame(width: size * 0.025, height: size * 0.025)
                    .offset(x: -middle * 0.6, y: -size * 0.12)
                    .opacity(ignitionIsOn && engineIsOn ? 1 : 0)
                    .animation(.default, value: engineIsOn)
                    
                    
            }
        }
    }
}

#Preview {
    DashboardView(temperature: 0, tachometerRotation: Double.random(in: 1...100), speed: 0, fuel: 35, ignitionIsOn: true, engineIsOn: false, opacity: 1)
        .frame(width: 400, height: 400)
}
