//
//  Planets.swift
//  B.U.B.B.L.E.S
//
//  Created by ditthales on 19/02/24.
//

import Foundation

enum Planet: String {
    case mercury = "Mercury"
    case venus = "Venus"
    case earth = "Earth"
    case mars = "Mars"
    case jupiter = "Jupiter"
    case saturn = "Saturn"
    case uranus = "Uranus"
    case neptune = "Neptune"
    
    var index: Int {
        switch self {
        case .mercury:
            1
        case .venus:
            2
        case .earth:
            3
        case .mars:
            4
        case .jupiter:
            5
        case .saturn:
            6
        case .uranus:
            7
        case .neptune:
            8
        }
    }
}
