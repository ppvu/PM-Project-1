//
//  Planet.swift
//  MyUniverseApp
//
//  Created by spezza on 25.01.2021.
//

import Foundation

// Planets' type
enum PlanetTypes: String, CaseIterable {
    case terrestial = "Terrestial"
    case gasGiant = "Gas Giant"
    case iceGiant = "Ice Giant"
    case dwarf = "Dwarf"
}

struct PlanetInfo: ElementsInfo {
    var type : String
    var age: UInt
    var name: String
    var mass: Int
    var temperature: Int
    var radius: Int
    var satelitesQ: Int
    var creationTime: Int
}

// Create Planet class
final class Planet {
    private var name: String
    private var age: UInt
    private var type: PlanetTypes
    private var mass: Int
    private var temp: Int
    private var radius: Int
    private var satellites: Int
    private var creationTime: Int = 0
    private var info: PlanetInfo
    
    init(pref: String) {
        self.name = nameGenerator(prefix: pref, length: 5)
        self.age = 0
        self.type = PlanetTypes.allCases.randomElement()!
        self.mass = Int.random(in: 1...100)
        self.temp = Int.random(in: 1...100)
        self.radius = Int.random(in: 1...100)
        self.satellites = Int.random(in: 0...4)
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

extension Planet {
    // Return Planet Info
    func createPlanet() -> PlanetInfo {
        return info
    }
}
