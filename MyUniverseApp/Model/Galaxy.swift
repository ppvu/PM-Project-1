//
//  Galaxy.swift
//  MyUniverseApp
//
//  Created by spezza on 25.01.2021.
//

import Foundation

enum GalaxyType: String, CaseIterable {
    case irregular = "Irregular"
    case elliptical = "Elliptical"
    case spiral = "Spiral"
}

struct GLInfo: ElementsInfo {
    var mass: Int
    var name: String
    var age: UInt
    var type: GalaxyType
}
// Create a Galaxy class
final class SingleGalaxy {
    
    private var name: String
    private var lifeCicle: Int = 0
    private var age: UInt = 0
    private var mass: Int = 0
    private var type = GalaxyType.allCases.randomElement()!
    private var maxQofPlanest: Int
    private var info: GLInfo
    
    init () {
        self.maxQofPlanest = 9
        self.name = nameGenerator(prefix: "GL", length: 5)
        self.info = GLInfo(mass: self.mass,
                           name: self.name,
                           age: self.age,
                           type: self.type)
    }
    // Return info about Galaxies
    func getGalaxyInfo() -> GLInfo {
        return info
    }
    
    func addTime(timeSec: UInt) {
        self.age = timeSec
    }
}
