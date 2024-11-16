//
//  LightIndicatorView.swift
//  AnimatedDashboard
//
//  Created by Winky51 on 14.11.2024.
//

import SwiftUI

struct LightIndicatorView: View {
    var body: some View {
        GeometryReader{ geometry in
            
            let hight = geometry.size.height
            let width = geometry.size.width
            let size = min(hight, width)
            let step = size / 100
            let middle = size / 2
            
            
            Path { path in
                path.addArc(
                    center: CGPoint(x: middle, y: middle),
                    radius: size * 0.3,
                    startAngle: .degrees(-140),
                    endAngle: .degrees(140),
                    clockwise: true
                )
                
                path.move(to: CGPoint(x: size * 0.2, y: size * 0.3))
                path.addLine(to: CGPoint(x: step * 6, y: size * 0.26))
                
                path.move(to: CGPoint(x: size * 0.2, y: size * 0.7))
                path.addLine(to: CGPoint(x: step * 6, y: size * 0.74))
                
                path.move(to: CGPoint(x: size * 0.16, y: middle))
                path.addLine(to: CGPoint(x: step * 3, y: middle))
                
                path.move(to: CGPoint(x: size * 0.27, y: size * 0.32))
                path.addQuadCurve(
                    to: CGPoint(x: size * 0.27, y: size * 0.68),
                    control: CGPoint(x: middle * 1.2, y: middle )
                )
                
                
            }
            .stroke(.green, style: StrokeStyle(lineWidth: step * 2))
            .shadow(color: .green, radius: step )
            
            Path { path in
                path.addArc(
                    center: CGPoint(x: middle, y: middle),
                    radius: size * 0.3,
                    startAngle: .degrees(-320),
                    endAngle: .degrees(320),
                    clockwise: true
                )
                
                path.move(to: CGPoint(x: size * 0.8, y: size * 0.3))
                path.addLine(to: CGPoint(x: size - step * 6, y: size * 0.26))
                
                path.move(to: CGPoint(x: size * 0.8, y: size * 0.7))
                path.addLine(to: CGPoint(x: size - step * 6, y: size * 0.74))
                
                path.move(to: CGPoint(x: size * 0.84, y: middle))
                path.addLine(to: CGPoint(x: size - step * 3, y: middle))
                
                path.move(to: CGPoint(x: size * 0.73, y: size * 0.32))
                path.addQuadCurve(
                    to: CGPoint(x: size * 0.73, y: size * 0.68),
                    control: CGPoint(x: middle * 0.8, y: middle )
                )
            }
            .stroke(.green, style: StrokeStyle(lineWidth: step * 2))
            .shadow(color: .green, radius: step )

        }
    }
}

#Preview {
    LightIndicatorView()
        .frame(width: 400, height: 400)
}
