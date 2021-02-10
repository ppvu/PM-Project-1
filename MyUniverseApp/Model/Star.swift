//
//  Star.swift
//  MyUniverseApp
//
//  Created by spezza on 25.01.2021.
//

import Foundation

enum TypeOfStar: String, CaseIterable {
    case protostar = "Protostar"
    case tTauriStar = "T-Tauri Star"
    case mainSequenceStar = "Main Sequence Star"
    case redGiantStar = "Red Giant Star"
    case whiteDwarfStar = "White Dwarf Star"
    case redDwarfStar = "Red Dwarf Star"
    case neutronStar = "Neutron Star"
    case superGiantStar = "Super Giant Star"
}

enum StarEvolutionStage: String, CaseIterable {
    case young = "Young"
    case old = "Old"
    case denceDwarf = "Dence Dwarf"
    case blackHole = "Black Hole"
}

final class MainStar {
    
    private var age: UInt = 0
    private var name: String
    private var type: TypeOfStar
    private var evolutionStage: StarEvolutionStage
    private var mass: Int
    private var temp: Int
    private var radius: Int
    private var luminosity: Int
    private var creationTime: Int = 0
    private var info: ElementsInfo
    
    init(){
        self.name = nameGenerator(prefix: "MS", length: 5)
        self.type = TypeOfStar.allCases.randomElement()!
        self.evolutionStage = .young
        self.mass = Int.random(in: 1...100)
        self.temp = Int.random(in: 1...100)
        self.radius = Int.random(in: 1...100)
        self.luminosity = Int.random(in: 1...100)
        
        self.info = ElementsInfo(name: self.name, description: "Age: \(self.age)\nMass: \(self.mass)\nType: \(self.type.rawValue)")
    }
}

extension MainStar {
    private func ageGrow() {
        age += 1
    }
    
    func createStar() -> ElementsInfo {
        return info
    }
    
    func addTime(timeSec: Int) {
        self.creationTime = timeSec
    }
}
