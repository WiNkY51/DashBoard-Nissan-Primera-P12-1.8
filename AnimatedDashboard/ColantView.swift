//
//  ColantView.swift
//  AnimatedDashboard
//
//  Created by Winky51 on 13.11.2024.
//

import SwiftUI

struct ColantView: View {
    let startAnglePointer: Double = -72
    var currentAnglePointer: Double
    var temperature: Double{
        startAnglePointer + currentAnglePointer
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
            let spacingIndicatorline = (pi * radius / 180 * 240) / 2
            
            
            
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
                    startAngle: .degrees(-40),
                    endAngle: .degrees(190),
                    clockwise: true
                )
            }
            .stroke(.orange, style: StrokeStyle(lineWidth: step * 7, dash: [step, spacingIndicatorline]))
            .shadow(color: .orange, radius: step)
            
            Path { path in
                path.move(to: CGPoint(x: middle, y: size * 0.8))
                path.addLine(to: CGPoint(x: middle, y: size * 0.9))
                path.move(to: CGPoint(x: middle - size * 0.07, y: size * 0.9))
                path.addLine(to: CGPoint(x: middle + size * 0.07, y: size * 0.9))
            }
            .stroke(.orange, style: StrokeStyle(lineWidth: step))
            .shadow(color: .orange, radius: step)
            
            Path { path in
                path.move(to: CGPoint(x: middle + step, y: size * 0.8))
                path.addLine(to: CGPoint(x: middle + step, y: size * 0.9))
            }
            .stroke(.orange, style: StrokeStyle(lineWidth: step * 3.2, dash: [step * 0.8, step * 2], dashPhase: step))
            
            Path { path in
                path.addArc(
                    center: CGPoint(x: step * 50, y: step * 50),
                    radius: radius - step * 0.1,
                    startAngle: .degrees(-40),
                    endAngle: .degrees(198),
                    clockwise: true
                )
            }
            .stroke(. orange, style: StrokeStyle(lineWidth: step * 3, dash: [step * 0.5, step * 10], dashPhase: step ))
            
            Path { path in
                path.addArc(
                    center: CGPoint(x: step * 50, y: step * 50),
                    radius: radius,
                    startAngle: .degrees(-40),
                    endAngle: .degrees(-20),
                    clockwise: false
                )
            }
            .stroke(.red, style: StrokeStyle(lineWidth: step * 7, dash: [step, spacingIndicatorline], dashPhase: -step * 14))
            .shadow(color: .red, radius: step)
            
            PointerView()
                .rotationEffect(.degrees(temperature))
                .animation(.default, value: temperature)
            Text("130").textModefire(step: step, x: 73, y: 34, color: .red)
        }
        
    }
}

#Preview {
    ColantView(currentAnglePointer: 0)
        .frame(width: 400, height: 400)
}
