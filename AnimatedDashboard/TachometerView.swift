//
//  TachometerView.swift
//  AnimatedDashboard
//
//  Created by Winky51 on 10.11.2024.
//

import SwiftUI

struct TachometerView: View {
    
    var currentAnglePointer: Double
    let startAnglePointer: Double = -112
    var endAnglePointer: Double {
        startAnglePointer + currentAnglePointer * 0.0275
    }
    
    var body: some View {
        GeometryReader { geometry in
            
            
            let pi = Double.pi
            let width = geometry.size.width
            let height = geometry.size.height
            let size = min(width, height)
            let step = size / 100
            let radius = step * 43
            let spacingLine = (pi * radius / 180 * 240) / 9
            
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
                    center: CGPoint(x: step * 50, y: step * 50),
                    radius: radius,
                    startAngle: .degrees(-38),
                    endAngle: .degrees(150),
                    clockwise: true
                )
            }
            .stroke(.orange, style: StrokeStyle(lineWidth: step * 7, dash: [step, spacingLine], dashPhase: step * 3))
            .shadow(color: .orange, radius: step)
            
            Path { path in
                path.addArc(
                    center: CGPoint(x: step * 50, y: step * 50),
                    radius: radius,
                    startAngle: .degrees(27),
                    endAngle: .degrees(-38),
                    clockwise: true
                )
            }
            .stroke(.red, style: StrokeStyle(lineWidth: step * 7, dash: [step, spacingLine], dashPhase: -step * 5.5))
            .shadow(color: .red, radius: step)
            
            Text("0").textModefire(step: step, x: 16, y: 60, color: .orange)
            Text("1").textModefire(step: step, x: 14, y: 42, color: .orange)
            Text("2").textModefire(step: step, x: 19, y: 26, color: .orange)
            Text("3").textModefire(step: step, x: 32, y: 16, color: .orange)
            Text("4").textModefire(step: step, x: 48, y: 11, color: .orange)
            Text("5").textModefire(step: step, x: 64, y: 15, color: .orange)
            Text("6").textModefire(step: step, x: 77, y: 26, color: .red)
            Text("7").textModefire(step: step, x: 84, y: 42, color: .red)
            Text("8").textModefire(step: step, x: 80, y: 60, color: .red)
            
            PointerView()
                .rotationEffect(.degrees(endAnglePointer))
                .animation(.default, value: endAnglePointer)
        }
    }
}

#Preview {
    TachometerView(currentAnglePointer: Double(800))
        .frame(width: 400, height: 400)
}
