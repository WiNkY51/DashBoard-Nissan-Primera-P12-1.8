//
//  FuelLevelView.swift
//  AnimatedDashboard
//
//  Created by Winky51 on 13.11.2024.
//

import SwiftUI

struct FuelLevelView: View {
    
    let startAnglePointer: Double = -59
    var fuelLevel: Double
    var currentAnglePointer: Double{
        startAnglePointer + 119 / 65 * fuelLevel
    }
    
    var body: some View {
        GeometryReader { geometry in
            let pi = Double.pi
            let width = geometry.size.width
            let height = geometry.size.height
            let size = min(width, height)
            let middle = size / 2
            let step = size / 100
            let radius = step * 43
            let spacingIndicatorline = (pi * radius / 180 * 240) / 8.5
            
            Path { path in
                path.addArc(
                    center: CGPoint(x: size / 2, y: size / 2),
                    radius: radius * 1.08,
                    startAngle: .degrees(50),
                    endAngle: .degrees(130),
                    clockwise: true
                )
            }
            .stroke(.orange, style: StrokeStyle(lineWidth: step * 2 ))
            .shadow(color: .orange, radius: step)
            
            Path { path in
                path.addArc(
                    center: CGPoint(x: middle, y: middle),
                    radius: radius,
                    startAngle: .degrees(212),
                    endAngle: .degrees(235),
                    clockwise: false
                )
            }
            .stroke(.red, style: StrokeStyle(lineWidth: step * 2, lineCap: .round))
            .shadow(color: .red, radius: step)
            
            
            Path { path in
                path.addArc(
                    center: CGPoint(x: middle, y: middle),
                    radius: radius,
                    startAngle: .degrees(210),
                    endAngle: .degrees(330),
                    clockwise: false
                )
            }
            .stroke(.orange, style: StrokeStyle(lineWidth: step * 7, dash:  [step, spacingIndicatorline]))
            .shadow(color: .orange, radius: step)
            
            Text("0").textModefire(step: step, x: 17, y: 29, color: .red)
            Text("1/2").textModefire(step: step, x:45, y: 11, color: .orange)
            Text("1").textModefire(step: step, x: 78, y: 29, color: .orange)
            
            PointerView()
                .rotationEffect(.degrees(currentAnglePointer))
                .animation(.default, value: fuelLevel)
        }
    }
}


#Preview {
    FuelLevelView(fuelLevel: 40)
        .frame(width: 400, height: 400)
}
