//
//  StarSolarSystem.swift
//  MyUniverseApp
//
//  Created by spezza on 25.01.2021.
//

import Foundation

final class SingleStarPlanetSystem {
    
    private var name: String
    private var lifeCicle: Int = 0
    private var age: UInt = 0
    private var mass: Int = 0
    private var maxQofPlanest: Int
    private var star: ElementsInfo
    private var planetQ: Int = 0
    private var info: ElementsInfo
    
    init (maxPlnQ: Int) {
        self.maxQofPlanest = maxPlnQ
        self.name = nameGenerator(prefix: "SPS",length: 5)
        self.info = ElementsInfo(name: self.name, description: "Mass: \(self.mass)")
        self.star = MainStar().createStar()
    }
}

extension SingleStarPlanetSystem {
   
    func getSPSInfo() -> ElementsInfo {
        return self.info
    }
    
    func getStarInfo() -> ElementsInfo {
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
