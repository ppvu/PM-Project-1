//
//  Creation.swift
//  MyUniverseApp
//
//  Created by spezza on 09.02.2021.
//

import Foundation

extension CreatorMode {
    func createUniverse() {
        let un = SingleUniverse()
        let unName = un.getUniverseInfo().name
        self.objectInfo.universesInfo[unName] = un.getUniverseInfo()
        self.instances.universesInstances[unName] = un
        self.objectNames.universesNames[unName] = []
    }
    
    func createGalaxy(unName: String) {
        let gl = SingleGalaxy()
        let glName = gl.getGalaxyInfo().name
        self.objectInfo.galaxysInfo[glName] = gl.getGalaxyInfo()
        self.instances.galaxysInstances[glName] = gl
        self.objectNames.galaxysNames[glName] = []
        self.objectNames.universesNames[unName]?.append(glName)
    }
    
    func createSPS(glName: String) {
        let sps = SingleStarPlanetSystem(maxPlnQ: self.creation.maxQofPlanest)
        let spsName = sps.getSPSInfo().name
        self.instances.spsInstances[spsName] = sps
        self.objectInfo.spsInfo[spsName] = sps.getSPSInfo()
        self.objectNames.spsNames[spsName] = []
        self.objectNames.spsStarNames.append(sps.getStarInfo().name)
        self.objectNames.spsNames[spsName]?.append(sps.getStarInfo().name)
        self.objectInfo.spsStartInfo[sps.getStarInfo().name] = sps.getStarInfo()
        self.objectNames.galaxysNames[glName]?.append(spsName)
        sps.addPlanet()
    }
    
    func createPlanet(spsName: String) {
        let pl = SinglePlanet()
        let plInfo = pl.getPlanetInfo()
        self.objectNames.planetsName.append(plInfo.name)
        self.objectInfo.planetsInfo[plInfo.name] = plInfo
        self.objectInfo.planetSatelitesInfo[plInfo.name] = pl.getPlanetSatelites()
        self.objectNames.spsNames[spsName]?.append(plInfo.name)
    }
}
