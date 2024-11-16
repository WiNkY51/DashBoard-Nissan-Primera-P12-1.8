//
//  OilPresureView.swift
//  AnimatedDashboard
//
//  Created by Winky51 on 14.11.2024.
//

import SwiftUI

struct OilPresureView: View {
    var body: some View {
        GeometryReader { geometry in
            
            let hight = geometry.size.height
            let width = geometry.size.width
            let size = min(hight, width)
            let step = size / 100
            
            Path { path in
                path.move(to: CGPoint(x: size * 0.25, y: size * 0.4))
                path.addLine(to: CGPoint(x: size * 0.1, y: size * 0.35))
                path.addLine(to: CGPoint(x: size * 0.13, y: size * 0.25))
                path.addLine(to: CGPoint(x: size * 0.25, y: size * 0.29))
                path.addLine(to: CGPoint(x: size * 0.25, y: size * 0.6))
                path.addLine(to: CGPoint(x: size * 0.65, y: size * 0.6))
                path.addLine(to: CGPoint(x: size * 0.8, y: size * 0.4))
                path.move(to: CGPoint(x: size * 0.25, y: size * 0.35))
                path.addLine(to: CGPoint(x: size * 0.5, y: size * 0.35))
                path.addLine(to: CGPoint(x: size * 0.57, y: size * 0.45))
                path.addLine(to: CGPoint(x: size * 0.9, y: size * 0.37))
                path.addLine(to: CGPoint(x: size * 0.93, y: size * 0.4))
                
                path.move(to: CGPoint(x: size * 0.37, y: size * 0.35))
                path.addLine(to: CGPoint(x: size * 0.37, y: size * 0.25))
                
                path.move(to: CGPoint(x: size * 0.32, y: size * 0.25))
                path.addLine(to: CGPoint(x: size * 0.42, y: size * 0.25))
            }
            .stroke(. red, style: StrokeStyle(lineWidth: step * 3))
            .shadow(color: .red, radius: step * 2)
        }
    }
}

#Preview {
    OilPresureView()
        .frame(width: 400, height: 400)
}
