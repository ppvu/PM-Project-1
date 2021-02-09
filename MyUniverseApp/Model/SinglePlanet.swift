//
//  SinglePlanet.swift
//  MyUniverseApp
//
//  Created by spezza on 09.02.2021.
//

import Foundation

// Class Planet
final class SinglePlanet {
    private var name: String
    private var age: UInt = 0
    private var type: PlanetTypes
    private var mass: Int
    private var temp: Int
    private var radius: Int
    private var satellites: Int
    private var satellitesData: [PlanetInfo] = []
    private var creationTime: Int = 0
    private var info: PlanetInfo
    
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
        self.info = PlanetInfo(type: self.type.rawValue,
                               age: self.age,
                               name: self.name,
                               mass: self.mass,
                               temperature: self.temp,
                               radius: self.radius,
                               satelitesQ: self.satellites,
                               creationTime: self.creationTime)
    }
}

extension SinglePlanet {
    func getPlanetInfo() -> PlanetInfo {
        return info
    }
 
    func getPlanetSatelites() -> [PlanetInfo] {
        return self.satellitesData
    }
    
    func addTime(timeSec: Int) {
        self.creationTime = timeSec
    }
}
