//
//  Star.swift
//  MyUniverseApp
//
//  Created by spezza on 25.01.2021.
//

import Foundation

// Type of Stars
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
// Stars' Evolution Stage
enum StarEvolutionStage: String, CaseIterable {
    case young = "Young"
    case old = "Old"
    case denceDwarf = "Dence Dwarf"
    case blackHole = "Black Hole"
}
// Info about Stars
struct StarInfo: ElementsInfo {
    var type : String
    var age: UInt
    var name: String
    var evolutionStage: String
    var mass: Int
    var temperature: Int
    var radius: Int
    var luminosity: Int
    var creationTime: Int
}
// Create Star class
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
    private var info: StarInfo
    
//    private var massToBecomeBlackHole: UInt
//    private var radiusToBecomeBlackHole: UInt
    
    init(){
        self.name = nameGenerator(prefix: "MS", length: 5)
        self.type = TypeOfStar.allCases.randomElement()!
        self.evolutionStage = .young
        self.mass = Int.random(in: 1...100)
        self.temp = Int.random(in: 1...100)
        self.radius = Int.random(in: 1...100)
        self.luminosity = Int.random(in: 1...100)
        
        self.info = StarInfo(type: self.type.rawValue,
                             age: self.age,
                             name: self.name,
                             evolutionStage: self.evolutionStage.rawValue,
                             mass: self.mass,
                             temperature: self.temp,
                             radius: self.radius,
                             luminosity: self.luminosity,
                             creationTime: self.creationTime)
    }
    // Return the info about Stars
    func createStar() -> StarInfo {
        return info
    }
    
    func addTime(timeSec: Int) {
        self.creationTime = timeSec
    }
}

extension MainStar {
    private func ageGrow() {
        age += 1
    }
    
    //Next stage of evo
    
//    private func toTheNextStage() {
//        switch evolutionStage {
//        case .young:
//            evolutionStage = .old
//        case .old:
//            evolutionStage = starFinalStage()
//        default:
//            return
//        }
//    }
    
//    private func starFinalStage() -> StarEvolutionStage {
//       
//    }
}
