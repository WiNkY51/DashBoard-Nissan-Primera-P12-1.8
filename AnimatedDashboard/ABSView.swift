//
//  ABSView.swift
//  AnimatedDashboard
//
//  Created by Winky51 on 13.11.2024.
//

import SwiftUI

struct ABSView: View {
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
                }
                .stroke(.orange, style: StrokeStyle(lineWidth: step * 2))
                .shadow(color: .orange, radius: step)
                
                Text("ABS")
                    .font(.system(size: size * 0.22))
                    .foregroundColor(.orange)
//                    .bold()
                    .shadow(color: .orange, radius: step)
                
                
                
                
                
                
                
            }
        }
    }
}

#Preview {
    ABSView()
        .frame(width: 400, height: 400)
}
