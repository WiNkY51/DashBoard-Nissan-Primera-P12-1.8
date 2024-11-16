//
//  ChargeLevelView.swift
//  AnimatedDashboard
//
//  Created by Winky51 on 14.11.2024.
//

import SwiftUI

struct ChargeLevelView: View {
    var body: some View {
        GeometryReader { geometry in
            
            let hight = geometry.size.height
            let width = geometry.size.width
            let size = min(hight, width)
            let step = size / 100
            
            Path { path in
                path.move(to: CGPoint(x: size * 0.2 - step, y: size * 0.3 ))
                path.addLine(to: CGPoint(x: size * 0.8, y: size * 0.3))
                path.addLine(to: CGPoint(x: size * 0.8, y: size * 0.65))
                path.addLine(to: CGPoint(x: size * 0.2, y: size * 0.65))
                path.addLine(to: CGPoint(x: size * 0.2, y: size * 0.3))
                
                path.move(to: CGPoint(x: size * 0.25, y: size * 0.28))
                path.addLine(to: CGPoint(x: size * 0.34, y: size * 0.28))
                
                path.move(to: CGPoint(x: size * 0.66, y: size * 0.28))
                path.addLine(to: CGPoint(x: size * 0.75, y: size * 0.28))
                
                path.move(to: CGPoint(x: size * 0.25, y: size * 0.43))
                path.addLine(to: CGPoint(x: size * 0.34, y: size * 0.43))
                
                path.move(to: CGPoint(x: size * 0.67, y: size * 0.43))
                path.addLine(to: CGPoint(x: size * 0.75, y: size * 0.43))
                path.move(to: CGPoint(x: size * 0.71, y: size * 0.39))
                path.addLine(to: CGPoint(x: size * 0.71, y: size * 0.47 ))
                
                
            }
            .stroke(Color.red, style: StrokeStyle(lineWidth: step * 2))
            .shadow(color: .red, radius: step)
        }
    }
}

#Preview {
    ChargeLevelView()
        .frame(width: 400, height: 400)
}
