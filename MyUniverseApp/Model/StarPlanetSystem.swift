//
//  StarSolarSystem.swift
//  MyUniverseApp
//
//  Created by spezza on 25.01.2021.
//

import Foundation

struct SPSInfoS: ElementsInfo {
    var mass: Int
    var name: String
    var age: UInt
    
    
}
// StarPlanetSystem Class
final class SingleStarPlanetSystem {
    
    private var name: String
    private var lifeCicle: Int = 0
    private var age: UInt = 0
    private var mass: Int = 0
    private var maxQofPlanest: Int
    private var star: StarInfo
    private var planetQ: Int = 0
    private var info: SPSInfoS
    
    init (maxPlnQ: Int) {
        self.maxQofPlanest = maxPlnQ
        self.name = nameGenerator(prefix: "SPS",length: 5)
        self.info = SPSInfoS(mass: self.mass,
                             name: self.name,
                             age: self.age)
        self.star = MainStar().createStar()
    }
    // Return info about StarPlanetSystem
    func getSPSInfo() -> SPSInfoS {
        return self.info
    }
    
    func getStarInfo() -> StarInfo {
        return self.star
    }
    
    func addPlanet() {
        if planetQ <= self.maxQofPlanest {
            self.planetQ += 1
        }
    }
    
    func addTime(timeSec: UInt) {
        self.age = timeSec
    }
}
