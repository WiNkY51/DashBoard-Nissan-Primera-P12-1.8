//
//  HardBraceIndicatorView.swift
//  AnimatedDashboard
//
//  Created by Winky51 on 12.11.2024.
//

import SwiftUI

struct HardBraceIndicatorView: View {
    var body: some View {
        GeometryReader{ geometry in
            
            let hight = geometry.size.height
            let width = geometry.size.width
            let size = min(hight, width)
            let step = size / 100
            let middle = size / 2
            
            ZStack(alignment: .center) {
                
                Path() { path in
                    
                    path.addArc(
                        center: CGPoint(x: middle, y: middle),
                        radius: middle / 2,
                        startAngle: .degrees(0),
                        endAngle: .degrees(360),
                        clockwise: true
                    )
                    
                    path.move(to: CGPoint(x: middle * 0.5, y: size * 0.25))
                    path.addQuadCurve(
                        to: CGPoint(x: middle * 0.5, y: size * 0.75),
                        control: CGPoint(x: size * 0.05, y: middle)
                    )
                    path.move(to: CGPoint(x: size * 0.75, y: size * 0.25))
                    path.addQuadCurve(
                        to: CGPoint(x: size * 0.75, y: size * 0.75),
                        control: CGPoint(x: size * 0.95, y: middle)
                    )
                    path.move(to: CGPoint(x: middle, y: middle * 0.8))
                    path.addQuadCurve(
                        to: CGPoint(x: middle, y: middle * 1.1),
                        control: CGPoint(x: middle + step, y: middle)
                    )
                    path.addQuadCurve(
                        to: CGPoint(x: middle, y: middle * 0.8),
                        control: CGPoint(x: middle - step, y: middle)
                    )
                    path.move(to: CGPoint(x: middle, y: middle * 1.2))
                    path.addQuadCurve(
                        to: CGPoint(x: middle, y: middle * 1.24),
                        control: CGPoint(x: middle - step, y: middle * 1.22 )
                    )
                    path.addQuadCurve(
                        to: CGPoint(x: middle, y: middle * 1.2),
                        control: CGPoint(x: middle + step, y: middle * 1.22 )
                    )
                    
                    
                }
                .stroke(.red, style: StrokeStyle(lineWidth: step * 2))
                .shadow(color: .red, radius: step)
                
                
                
                
                
                
                
            }
        }
    }
}

#Preview {
    HardBraceIndicatorView()
        .frame(minWidth: 400, minHeight: 400)
}
