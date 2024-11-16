//
//  Gears.swift
//  AnimatedDashboard
//
//  Created by Winky51 on 12.11.2024.
//

import Foundation


struct Gears {

    let gear: Gear
    
    
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
        
    }
}


