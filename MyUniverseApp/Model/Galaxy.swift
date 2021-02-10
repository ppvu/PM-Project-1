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

final class SingleGalaxy {
    
    private var name: String
    private var lifeCicle: Int = 0
    private var age: UInt = 0
    private var mass: Int = 0
    private var type = GalaxyType.allCases.randomElement()!
    private var maxQofPlanest: Int
    private var info: ElementsInfo
    
    init () {
        self.maxQofPlanest = 9
        self.name = nameGenerator(prefix: "GL", length: 5)
        self.info = ElementsInfo(name: self.name, description: "Age: \(self.age)\nMass: \(self.mass)\nType: \(self.type.rawValue)")
    }
}

extension SingleGalaxy {
    func getGalaxyInfo() -> ElementsInfo {
        return info
    }
    
    func addTime(timeSec: UInt) {
        self.age = timeSec
    }
    
    private func ageGrow() {
        age += 1
    }
}
