//
//  ContentViewViewModel.swift
//  AnimatedDashboard
//
//  Created by Winky51 on 12.11.2024.
//

import SwiftUI
import Observation

@Observable final class ContentViewViewModel {
    
    var engineRotations: Double = 0
    var engineTemperature: Double = 0
    var fuelLevel: Double = 0
    var gear: Gear = .neutral
    
    var engineIsOn = false
    var ignitionIsOn = false
    var ignitionOpacity = 0.3
    var raceButtonTitle = "Go"
    private var shiftFlag = true
    
    private var timer: Timer?
    
    func toggleEngine() {
        engineIsOn.toggle()
        
        if engineIsOn {
            engineRotations = 800
        } else {
            engineRotations = 0
        }
        
        
    }
    
    func toggleIgnition() {
        ignitionIsOn.toggle()
        engineIsOn = false
        
        if ignitionIsOn {
            engineTemperature = 80
            ignitionOpacity = 1
            fuelLevel = .random(in: 0...65)
        } else {
            engineRotations = 0
            engineTemperature = 0
            ignitionOpacity = 0.3
            fuelLevel = 0
        }
    }
    
    func calculateSpeed() -> Double {
        let pi = Double.pi
        let willDiameter: Double = 0.205 * 0.55 * 2 + 16 * 2.54 / 100
        let willDistance: Double = willDiameter * pi
        let speed = willDistance / gear.gear * (60 / 1000) * engineRotations
        
        if  speed.isNaN {
            return 0
        } else if speed.isInfinite {
            return 0
        } else {
            return speed
        }
    }
    
    func gearUp() {
        switch gear {
            case .reverse:
                gear = .neutral
            case .neutral:
                gear = .one
            case .one:
                gear = .two
            case .two:
                gear = .three
            case .three:
                gear = .four
            case .four:
                gear = .five
            case .five:
                gear = .five
                
        }
    }
    
    func gearDown() {
        switch gear {
            case .reverse:
                gear = .reverse
            case .neutral:
                gear = .reverse
            case .one:
                gear = .neutral
            case .two:
                gear = .one
            case .three:
                gear = .two
            case .four:
                gear = .three
            case .five:
                gear = .four
        }
    }
    
    private func autoRace() {
        gear = .one
        
        timer = Timer.scheduledTimer(
            timeInterval: gear.gearShiftingTime,
            target: self,
            selector: #selector(updateGear),
            userInfo: nil,
            repeats: true
        )
    }
    
    @objc private func updateGear() {
        switch gear {
            case .reverse:
                engineRotations = 0
            case .neutral:
                updataEngineRotations()
            case .one:
                if shiftFlag {
                    engineRotations = 500
                    updataEngineRotations()
                    shiftFlag = false
                } else {
                    updataEngineRotations()
                }
            case .two:
                if shiftFlag {
                    engineRotations = 1100
                    updataEngineRotations()
                    shiftFlag = false
                } else {
                    updataEngineRotations()
                }
            case .three:
                if shiftFlag {
                    engineRotations = 1600
                    updataEngineRotations()
                    shiftFlag = false
                } else {
                    updataEngineRotations()
                }
            case .four:
                if shiftFlag {
                    engineRotations = 2100
                    updataEngineRotations()
                    shiftFlag = false
                } else {
                    updataEngineRotations()
                }
            case .five:
                if shiftFlag {
                    engineRotations = 3200
                    updataEngineRotations()
                    shiftFlag = false
                } else {
                    updataEngineRotations()
                }
        }
    }
    private func updataEngineRotations() {
        
        if engineRotations < gear.gearUp{
            engineRotations += 100
        } else {
            if gear == .five {
                kilTimer()
                raceButtonTitle = "Reset"
            } else {
                gearUp()
                shiftFlag = true
            }
        }
        
    }
    private func kilTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func raceButtonDidTap() {
        if raceButtonTitle == "Reset" {
            
            if engineIsOn {
                engineRotations = 800
            } else {
                engineRotations = 0
            }
            gear = .neutral
            raceButtonTitle = "Go"
        } else if raceButtonTitle == "Raced"{
            engineRotations = 800
            gear = .neutral
            kilTimer()
            raceButtonTitle = "Start"
        } else {
            raceButtonTitle = "Raced"
            autoRace()
        }
    }
}

extension ContentViewViewModel {
    enum Gear: CaseIterable {
        case reverse, neutral, one, two, three, four, five
        
        
        var gear: Double {
            switch self {
                case .reverse:
                    13.324
                case .neutral:
                    0
                case .one:
                    13.286
                case .two:
                    7.171
                case .three:
                    4.987
                case .four:
                    3.640
                case .five:
                    2.985
            }
        }
        
        var title: String {
            switch self {
                case .reverse:
                    "R"
                case .neutral:
                    "N"
                case .one:
                    "1"
                case .two:
                    "2"
                case .three:
                    "3"
                case .four:
                    "4"
                case .five:
                    "5"
            }
        }
        
        var gearUp: Double {
            switch self {
                case .reverse:
                    1500
                case .neutral:
                    1000
                case .one:
                    1700
                case .two:
                    2500
                case .three:
                    3000
                case .four:
                    4000
                case .five:
                    6000
            }
        }
        
        var gearShiftingTime: Double {
            switch self {
                case .reverse:
                    0.1
                case .neutral:
                    0
                case .one:
                    0.2
                case .two:
                    0.6
                case .three:
                    1
                case .four:
                    1.7
                case .five:
                    2.6
            }
        }
    }
}
