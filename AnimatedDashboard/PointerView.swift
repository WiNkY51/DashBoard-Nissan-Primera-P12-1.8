//
//  PointerView.swift
//  AnimatedDashboard
//
//  Created by Winky51 on 11.11.2024.
//

import SwiftUI

struct PointerView: View {
    var body: some View {
        GeometryReader { geometry in
            
            let width = geometry.size.width
            let height = geometry.size.height
            let size = min(width, height)
            let middle = size / 2
            let step = size / 100
            
            Path { path in
                path.move(to: CGPoint(x: middle - step, y: middle * 1.2))
                path.addLine(to: CGPoint(x: middle + step, y: middle * 1.2))
                path.addLine(to: CGPoint(x: middle, y: middle * 0.2))
                path.addLine(to: CGPoint(x: middle - step, y: middle * 1.2))
            }
            .stroke(.red, style: StrokeStyle(lineWidth: step))
            .shadow(color: .red, radius: step)
            
        }
    }
}

#Preview {
    PointerView()
        .frame(width: 400, height: 400)
}
