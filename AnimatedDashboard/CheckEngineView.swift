//
//  CheckEngineView.swift
//  AnimatedDashboard
//
//  Created by Winky51 on 14.11.2024.
//

import SwiftUI

struct CheckEngineView: View {
    var body: some View {
        GeometryReader { geometry in
            
            let hight = geometry.size.height
            let width = geometry.size.width
            let size = min(hight, width)
            let step = size / 100
            
            Path { path in
                path.move(to: CGPoint(x: size * 0.08, y: size * 0.35))
                path.addLine(to: CGPoint(x: size * 0.08, y: size * 0.65))
                path.move(to: CGPoint(x: size * 0.1, y: size * 0.5))
                path.addLine(to: CGPoint(x: size * 0.15, y: size * 0.5))
                
                path.move(to: CGPoint(x: size * 0.15, y: size * 0.7))
                path.addLine(to: CGPoint(x: size * 0.15, y: size * 0.35))
                path.addLine(to: CGPoint(x: size * 0.25, y: size * 0.35))
                path.addLine(to: CGPoint(x: size * 0.3, y: size * 0.3))
                path.addLine(to: CGPoint(x: size * 0.6, y: size * 0.3))
                path.addLine(to: CGPoint(x: size * 0.65, y: size * 0.35))
                path.addLine(to: CGPoint(x: size * 0.75, y: size * 0.35))
                path.addLine(to: CGPoint(x: size * 0.75, y: size * 0.47))
                path.addLine(to: CGPoint(x: size * 0.8, y: size * 0.47))
                path.addLine(to: CGPoint(x: size * 0.8, y: size * 0.37))
                path.addLine(to: CGPoint(x: size * 0.87, y: size * 0.37))
                path.addQuadCurve(
                    to: CGPoint(x: size * 0.87, y: size * 0.82),
                    control: CGPoint(x: size * 0.92, y: size * 0.60)
                )
                path.addLine(to: CGPoint(x: size * 0.8, y: size * 0.82))
                path.addLine(to: CGPoint(x: size * 0.8, y: size * 0.72))
                path.addLine(to: CGPoint(x: size * 0.75, y: size * 0.72))
                path.addLine(to: CGPoint(x: size * 0.75, y: size * 0.85))
                path.addLine(to: CGPoint(x: size * 0.45, y: size * 0.85))
                path.addLine(to: CGPoint(x: size * 0.27, y: size * 0.7))
                path.addLine(to: CGPoint(x: size * 0.15, y: size * 0.7))
                path.move(to: CGPoint(x: size * 0.4, y: size * 0.27))
                path.addLine(to: CGPoint(x: size * 0.5, y: size * 0.27))
                path.move(to: CGPoint(x: size * 0.3, y: size * 0.24))
                path.addLine(to: CGPoint(x: size * 0.6, y: size * 0.24))
                
            }
            .stroke(.orange, style: StrokeStyle(lineWidth: step * 3, lineCap: .round))
            .shadow(color: .orange, radius: step * 2)
            
            
            
            
        }
    }
}

#Preview {
    CheckEngineView()
        .frame(width: 400, height: 400)
}
