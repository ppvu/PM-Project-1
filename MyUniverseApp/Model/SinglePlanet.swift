//
//  SinglePlanet.swift
//  MyUniverseApp
//
//  Created by spezza on 09.02.2021.
//

import Foundation

final class SinglePlanet {
    private var name: String
    private var age: UInt = 0
    private var type: PlanetTypes
    private var mass: Int
    private var temp: Int
    private var radius: Int
    private var satellites: Int
    private var satellitesData: [ElementsInfo] = []
    private var creationTime: Int = 0
    private var info: ElementsInfo
    
    init() {
        self.name = nameGenerator(prefix: "PL", length: 5)
        self.type = PlanetTypes.allCases.randomElement()!
        self.mass = Int.random(in: 1...100)
        self.temp = Int.random(in: 1...100)
        self.radius = Int.random(in: 1...100)
        self.satellites = Int.random(in: 0...4)
        for _ in 0...self.satellites {
            self.satellitesData.append(Planet(pref: "SPL").createPlanet())
        }
        self.info = ElementsInfo(name: self.name, description: "Age: \(self.age)\nMass: \(self.mass)\nType: \(self.type.rawValue)")
    }
}

extension SinglePlanet {
    func getPlanetInfo() -> ElementsInfo {
        return info
    }
 
    func getPlanetSatelites() -> [ElementsInfo] {
        return self.satellitesData
    }
    
    func addTime(timeSec: Int) {
        self.creationTime = timeSec
    }
}
