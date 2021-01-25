////
////  Structs.swift
////  UniverseApp
////
////  Created by spezza on 14.01.2021.
////
//
//import Foundation
//
//enum PlanetTypes: CaseIterable {
//    case terrestial
//    case gasGiant
//    case iceGiant
//    case dwarf
//}
//
////    var type: PlanetTypes = PlanetTypes.allCases.randomElement()!
////    var mass: Int = Int.random(in: 1..<10)
////    var temp: Int = Int.random(in: 1..<10)
////    var radius: Int = Int.random(in: 1..<10)
//
//enum TypeOfStar: CaseIterable {
//    case protostar
//    case tTauriStar
//    case mainSequenceStar
//    case redGiantStar
//    case whiteDwarfStar
//    case redDwarfStar
//    case neutronStar
//    case superGiantStar
//}
//
//enum StarEvolutionStage: CaseIterable {
//    case young
//    case old
//    case denceDwarf
//    case blackHole
//}
//
////struct Star {
////    var type: TypeOfStar = TypeOfStar.allCases.randomElement()!
////    var evolutionStage: StarEvolutionStage
////    var mass: Int = Int.random(in: 1..<100)
////    var temp: Int = Int.random(in: 1..<100)
////    var radius: Int = Int.random(in: 1..<100)
////    var brightness: Int = Int.random(in: 1..<100)
////}
//
//
//class Universe: SpaceObj {
//    var name: String = "Universe"
//    
//    var age: UInt = 0
//    
//    func tick() {
//        age += 1
//        for galaxy in self.galaxies {
//            galaxy.tick()
//        }
//        if age % 10 == 0 {
//            galaxies.append(Galaxy.createGalaxy())
//        }
//        
//        
//        
//    }
//    
//    var timer: Timer!
//    
//    var galaxies: [Galaxy] = .init()
//    
//    var childs: [SpaceObj] {
//        return galaxies
//    }
//    
//    
//    
//    
//    //создать интовую переменную и проверить делится ли на 10 без остатка
//    //в каждом объекте нужно подписываться на таймер
//    
//    
//    init() {
//        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in self.tick()
//        }
//        galaxies.append(Galaxy.createGalaxy())
//        galaxies.append(Galaxy.createGalaxy())
//        galaxies.append(Galaxy.createGalaxy())
//        galaxies.append(Galaxy.createGalaxy())
//        galaxies.append(Galaxy.createGalaxy())
//    }
//    
//    
//}
//
//class Galaxy: SpaceObj {
//    var childs: [SpaceObj] {
//        return starPlanetSystems
//    }
//    
//    
//   
//    
//    var name: String = "GLX: \(Int.random(in: 1..<1000000))"
//    
//    var age: UInt = 0
//    
//    func tick() {
//        age += 1
//    }
//    
//    var starPlanetSystems: [StarPlanetSystem] = .init()
//    
//    static func createGalaxy() -> Galaxy {
//        return Galaxy()
//    }
//    
//    init() {
//        starPlanetSystems.append(StarPlanetSystem())
//        starPlanetSystems.append(StarPlanetSystem())
//        starPlanetSystems.append(StarPlanetSystem())
//        starPlanetSystems.append(StarPlanetSystem())
//        starPlanetSystems.append(StarPlanetSystem())
//    }
//    
//    
//    }
//
//class StarPlanetSystem: SpaceObj {
//    var name: String = "SPS: \(Int.random(in: 1..<1000000))"
//    
//    var age: UInt = 0
//    
//    var childs: [SpaceObj] {
//        return stars
//    }
//    
//    
//    func tick() {
//        age += 1
//    }
//    
//    var stars: [Star] = .init()
//    var planets: [Planet] = .init()
//    
//    static func createStarPlanetSystem() -> StarPlanetSystem {
//        return StarPlanetSystem()
//    }
//    
//    init() {
//        stars.append(Star())
//        stars.append(Star())
//        stars.append(Star())
//        stars.append(Star())
//        stars.append(Star())
//        planets.append(Planet())
//        planets.append(Planet())
//        planets.append(Planet())
//        planets.append(Planet())
//        planets.append(Planet())
//    }
//}
//
//class Star: SpaceObj {
//    var name: String = "STAR: \(Int.random(in: 1..<1000000))"
//    var age: UInt = 0
//    var type: TypeOfStar = TypeOfStar.allCases.randomElement()!
//    var evolutionStage: StarEvolutionStage = StarEvolutionStage.young
//    var mass: Float = Float.random(in: 1..<100000)
//    var temp: Float = Float.random(in: 1..<100000)
//    var radius: Float = Float.random(in: 1..<100000)
//    var luminosity: Float = Float.random(in: 1..<100000)
//    
//    var childs: [SpaceObj] = []
//    
//    static func createStar() -> Star {
//        return Star()
//    }
//    
//    func tick() {
//        age += 1
//        
//    }
//    
//    var starsList: [Star] = .init()
//    
//    
//}
//
//class Planet: SpaceObj {
//    
//    var name: String = "PL: \(Int.random(in: 1..<1000000))"
//    var age: UInt = 0
//    var type: PlanetTypes = PlanetTypes.allCases.randomElement()!
//    var mass: Int = Int.random(in: 1..<100000)
//    var temp: Int = Int.random(in: 1..<1000000)
//    var radius: Int = Int.random(in: 1..<100000)
//    var areSettles: Bool = false
//    
//    var childs: [SpaceObj] = []
//    
//    static func createPlanet() -> Planet {
//        return Planet()
//    }
//    
//    func tick() {
//        age += 1
//    }
//    
//    var planetsList: [Planet] = .init()
//    var settles: [Planet] = .init()
//    
//    
//    
//}
//
//
//protocol SpaceObj {
//    var name: String { get }
//    var age: UInt { get }
//    
//    var childs: [SpaceObj] { get }
//    
//    func tick()
//}
//
//
//
//
