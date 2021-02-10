//
//  Planet.swift
//  MyUniverseApp
//
//  Created by spezza on 25.01.2021.
//

import Foundation

enum PlanetTypes: String, CaseIterable {
    case terrestial = "Terrestial"
    case gasGiant = "Gas Giant"
    case iceGiant = "Ice Giant"
    case dwarf = "Dwarf"
}

final class Planet {
    private var name: String
    private var age: UInt
    private var type: PlanetTypes
    private var mass: Int
    private var temp: Int
    private var radius: Int
    private var satellites: Int
    private var creationTime: Int = 0
    private var info: ElementsInfo
    
    init(pref: String) {
        self.name = nameGenerator(prefix: pref, length: 5)
        self.age = 0
        self.type = PlanetTypes.allCases.randomElement()!
        self.mass = Int.random(in: 1...100)
        self.temp = Int.random(in: 1...100)
        self.radius = Int.random(in: 1...100)
        self.satellites = Int.random(in: 0...4)
        self.info = ElementsInfo(name: self.name, description: "Age: \(self.age)\nMass: \(self.mass)\nType: \(self.type.rawValue)")
    }
}

extension Planet {
    func createPlanet() -> ElementsInfo {
        return info
    }
    
    private func ageGrow() {
        age += 1
    }
}
