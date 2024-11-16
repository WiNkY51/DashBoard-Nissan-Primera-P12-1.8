//
//  SpeedometerView.swift
//  AnimatedDashboard
//
//  Created by Winky51 on 09.11.2024.
//

import SwiftUI

struct SpeedometerView: View {
    let startAnglePointer: Double = -120
    var currentAnglePointer: Double
    var speed: Double{
        startAnglePointer + currentAnglePointer
    }
    var body: some View {
        GeometryReader { geometry in
            let pi = Double.pi
            let width = geometry.size.width
            let height = geometry.size.height
            let size = min(width, height)
            let step = size / 100
            let radius = step * 43
            let spacingSpeedline = (pi * radius / 180 * 240) / 13
            
            
            
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
                    startAngle: .degrees(30),
                    endAngle: .degrees(150),
                    clockwise: true
                )
            }
            .stroke(.orange, style: StrokeStyle(lineWidth: step * 7, dash: [step, spacingSpeedline]))
            .shadow(color: .orange, radius: step)
            
            Path() { path in
                path.addArc(
                    center: CGPoint(x: size / 2, y: size / 2),
                    radius: radius ,
                    startAngle: .degrees(20),
                    endAngle: .degrees(160),
                    clockwise: true
                )
            }
            .stroke(.orange ,style: StrokeStyle(lineWidth: step * 4.5, dash: [step, spacingSpeedline]))
            .shadow(color: .orange, radius: step)
            
            
            Text("0").textModefire(step: step, x: 16, y: 64, color: .orange)
            Text("20").textModefire(step: step, x: 11, y: 51, color: .orange)
            Text("40").textModefire(step: step, x: 12, y: 39, color: .orange)
            Text("60").textModefire(step: step, x: 16, y: 27, color: .orange)
            Text("80").textModefire(step: step, x: 24, y: 19, color: .orange)
            Text("100").textModefire(step: step, x: 31, y: 12, color: .orange)
            Text("120").textModefire(step: step, x: 45, y: 9, color: .orange)
            Text("140").textModefire(step: step, x: 58, y: 12, color: .orange)
            Text("160").textModefire(step: step, x: 64, y: 19, color: .orange)
            Text("180").textModefire(step: step, x: 72, y: 27, color: .orange)
            Text("200").textModefire(step: step, x: 76, y: 39, color: .orange)
            Text("220").textModefire(step: step, x: 76, y: 51, color: .orange)
            Text("240").textModefire(step: step, x: 71, y: 64, color: .orange)
                
            RoundedRectangle(cornerRadius: step * 2)
                .frame(width: size / 3, height: size / 6)
                .foregroundStyle(.orange)
                .shadow(color: .orange, radius: step)
                .offset(x: size / 3, y: size / 1.25)
                .overlay {
                    Text("123456").textModefire(step:step, x: 33.33, y: 76, color: .black)
                    Text("123456").textModefire(step:step, x: 33.33, y: 84, color: .black)
                }
            
            Path { path in
                path.move(to: CGPoint(x: size / 2, y: size / 2))
                path.addLine(to: CGPoint(x: step , y: size / 2))
            }
            
            PointerView()
                .rotationEffect(.degrees(speed))
                .animation(.linear, value: speed)
            
           
                
            
            
           
        }
    }
}

#Preview {
    SpeedometerView(currentAnglePointer: 0)
        .frame(width: 400, height: 400)
}

struct TextModefire: ViewModifier {
    
    let step: CGFloat
    let x: CGFloat
    let y: CGFloat
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: step * 7))
            .foregroundStyle(color)
            .offset(x: step * x, y: step * y)
            .shadow(color: color, radius: step)
    }
    
}

extension Text {
    public func textModefire(step: CGFloat, x: CGFloat, y: CGFloat, color: Color) -> some View {
        modifier(TextModefire(step: step, x: x, y: y, color: color))
    }
}
