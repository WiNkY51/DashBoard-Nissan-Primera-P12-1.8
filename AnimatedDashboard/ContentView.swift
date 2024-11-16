//
//  ContentView.swift
//  AnimatedDashboard
//
//  Created by Winky51 on 09.11.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var contentViewVM = ContentViewViewModel()
    
    
    var body: some View {
        GeometryReader{  geometry in
            ZStack{
                Color(.white).ignoresSafeArea()
                VStack{
                    
                    let width = geometry.size.width
                    
                    DashboardView(
                        temperature: contentViewVM.engineTemperature,
                        tachometerRotation: contentViewVM.engineRotations,
                        speed: contentViewVM.calculateSpeed(),
                        fuel: contentViewVM.fuelLevel,
                        ignitionIsOn: contentViewVM.ignitionIsOn,
                        engineIsOn: contentViewVM.engineIsOn,
                        opacity: contentViewVM.ignitionOpacity
                    )
                    .frame(width: width, height: width)
                    .animation(.default, value: contentViewVM.ignitionOpacity)
                    
                    HStack{
                        ControlButton(size: width, backgroundColor: .mint, title: "Ignition", action: {contentViewVM.toggleIgnition()})
                        ControlButton(
                            size: width,
                            backgroundColor: contentViewVM.ignitionIsOn ? .red : .gray,
                            title: contentViewVM.engineIsOn ? "Stop" : "Start",
                            action: {contentViewVM.toggleEngine()}
                        )
                        .disabled(!contentViewVM.ignitionIsOn)
                        
                        Color(.blue)
                            .clipShape(.rect (cornerRadius: width / 50))
                            .opacity( 0.7)
                            .frame(width: width * 0.4, height: width * 0.1)
                            .overlay {
                                ZStack{
                                    RoundedRectangle(cornerRadius: width / 50)
                                        .stroke(.black, style: StrokeStyle( lineWidth: width * 0.005))
                                    
                                    
                                    Text("Gear: \(contentViewVM.gear.title)")
                                        .foregroundStyle(.black)
                                    
                                }
                            }
                    }
                    ControlButton(
                        size: width,
                        backgroundColor: contentViewVM.engineIsOn && contentViewVM.ignitionIsOn ? .green : .gray,
                        title: contentViewVM.raceButtonTitle
                    ) {
                        contentViewVM.raceButtonDidTap()
                    }
                    .disabled( !contentViewVM.engineIsOn)
                    
                }
            }
        }
    }
}


#Preview {
    ContentView()
    
}

struct ControlButton: View {
    var size: CGFloat
    let backgroundColor: Color
    let title: String
    let action: () -> Void
    var body: some View {
        
        Button(action: action){
            Color(backgroundColor)
                .clipShape(.rect(cornerRadius: size / 50))
                .frame(width: size * 0.2, height:   size * 0.1)
                .overlay {
                    RoundedRectangle(cornerRadius: size / 50)
                        .stroke(.black, style: StrokeStyle(lineWidth: size * 0.005))
                    Text(title).foregroundStyle(.black)
                }
            
            
        }
    }
    
}
