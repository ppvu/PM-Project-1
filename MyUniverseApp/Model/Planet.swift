//
//  Planet.swift
//  MyUniverseApp
//
//  Created by spezza on 25.01.2021.
//

import Foundation

// определяем тип пленеты
enum PlanetTypes: String, CaseIterable {
    case terrestial = "Terrestial"
    case gasGiant = "Gas Giant"
    case iceGiant = "Ice Giant"
    case dwarf = "Dwarf"
}

//final class Planet {
//
//    var nameGenerator = NameGenerator()
//
//    var name: String
//    var type = PlanetTypes.allCases.randomElement()!
//    var mass = UInt.random(in: 1...10000)
//    var temp = UInt.random(in: 1...1000)
//    var radius = UInt.random(in: 1...500)
//    var satellites = [Planet]()
//
//    init(name: String, isPlanetSatellite: Bool) {
//
//        self.name = name
//
//        guard isPlanetSatellite == false else {
//            return
//        }
//
//        var quantityOfSatellites = UInt.random(in: 0...5)
//
//        while quantityOfSatellites > 0 {
//            satellites.append(Planet(name: "Satellite \(nameGenerator)", isPlanetSatellite: true))
//            quantityOfSatellites -= 1
//        }
//    }
//}
//---------------------- Planet -----------------------
// определяем тип пленеты
// структура инфы о планете
struct PlanetInfo {
    var type : String
    var name: String
    var mass: Int
    var temperature: Int
    var radius: Int
    var satelitesQ: Int
    var creationTime: Int
}
//
final class Planet {
    private var name: String
    private var type: PlanetTypes
    private var mass: Int
    private var temp: Int
    private var radius: Int
    private var satellites: Int
    private var creationTime: Int = 0
    private var info: PlanetInfo
    init(pref: String) {
        self.name = nameGenerator(prefix: pref, length: 5)
        self.type = PlanetTypes.allCases.randomElement()!
        self.mass = Int.random(in: 1...10)
        self.temp = Int.random(in: 1...10)
        self.radius = Int.random(in: 1...10)
        self.satellites = Int.random(in: 0...5)
        self.info = PlanetInfo(type: self.type.rawValue, name: self.name, mass: self.mass, temperature: self.temp, radius: self.radius, satelitesQ: self.satellites, creationTime: self.creationTime)
        self.createPlanet()
    }
    // возвращаем инфу планете
    func createPlanet() -> PlanetInfo {
        return info
    }
}
// класс планета
final class SinglePlanet {
    private var name: String
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
        self.mass = Int.random(in: 1...10)
        self.temp = Int.random(in: 1...10)
        self.radius = Int.random(in: 1...10)
        self.satellites = Int.random(in: 0...5)
        for _ in 0...self.satellites {
            self.satellitesData.append(Planet(pref: "SPL").createPlanet())
        }
        self.info = PlanetInfo(type: self.type.rawValue, name: self.name, mass: self.mass, temperature: self.temp, radius: self.radius, satelitesQ: self.satellites, creationTime: self.creationTime)
    }
    // возвращаем инфу о планете
    func getPlanetInfo() -> PlanetInfo {
        return info
    }
    // возвращаем инфу о спутниках
    func getPlanetSatelites() -> [PlanetInfo] {
        return self.satellitesData
    }
    func addTime(timeSec: Int) {
        self.creationTime = timeSec
    }
}
