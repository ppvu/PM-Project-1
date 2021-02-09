//
//  BusinessLogic.swift
//  MyUniverseApp
//
//  Created by spezza on 18.01.2021.
//

import Foundation

enum ElementNames {
    case universe, galaxys, sps, spsStars, planets
}

enum ElementNameForData {
    case universe, galaxys, sps, planets, satellites
}

final class CreatorMode {
    private var history = "\n Creation history:\n"
    
    private var creationTimerSec: Int = 0
    private var creationTimerMin: Int = 0
    private var universeTime: Int = 0
    private var createdUniverses: [String: Any] = [:]
    private var createdGlaxys: [String: Any] = [:]
    private var maxQofPlanest: Int = 9
    
    private var universesInstances: [String: SingleUniverse] = [:]
    private var galaxysInstances: [String: SingleGalaxy] = [:]
    private var spsInstances: [String: SingleStarPlanetSystem] = [:]
    
    private var universesNames: [String: [String]] = [:] // key - name of universe / value - arr of galaxys
    private var galaxysNames: [String: [String]] = [:]  // key - name gf galaxy / value - arr of sps
    private var spsNames: [String: [String]] = [:]
    private var spsStarNames: [String] = []
    private var planetsName: [String] = []
    
    private var universesInfo: [String: UNInfo] = [:]
    private var galaxysInfo: [String: GLInfo] = [:]
    private var spsInfo: [String: SPSInfoS] = [:]
    private var spsStartInfo: [String: StarInfo] = [:]
    private var planetsInfo: [String: PlanetInfo] = [:]
    private var planetSatelitesInfo: [String: [PlanetInfo]] = [:]
    
    private var defaultElementsListQ: Int = 20
    private var defaultListPage: Int = 1
    
    init() { self.createUniverse() }
    
    func time() {
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.universeTime += 1
            if self.creationTimerSec == 59 {
                self.creationTimerSec = 0
                self.creationTimerMin += 1
            }
            self.creationTimerSec += 1
            self.tickTime()
        }
    }
}

extension CreatorMode {
    private func pageSpliter (arr: [String], elemQuantity: Int, page: UInt) -> [String] {
        let eq = elemQuantity == 0 ? 0 : elemQuantity - 1
        let pg = Int((Double(arr.count) / Double(elemQuantity)).rounded()) * eq
        var result: [String] = []
        if arr.count <= eq {
            result = arr
        } else if page <= 1 {
            result = Array(arr[...eq])
        } else if page > 1 {
            result = Array(arr[pg...(pg + eq)])
        }
        return result
    }
}

extension CreatorMode {
    func getNames(data: ElementNames, elemQuantity: Int = 20, page: Int = 1) -> [String] {
        var res: [String] = []
        switch data {
        case .universe: res = Array(self.universesNames.keys)
        case .galaxys: res = Array(self.galaxysNames.keys)
        case .sps: res = Array(self.spsNames.keys)
        case .spsStars:  res = self.spsStarNames
        case .planets: res = self.planetsName
        }
        return self.pageSpliter(arr: res, elemQuantity: elemQuantity, page: UInt(page))
    }
}

extension CreatorMode {
    func getUnInfo(data: ElementNames, elemQuantity: Int = 20, page: Int = 1) -> [ElementsInfo] {
        var res: [ElementsInfo] = []
        switch data {
        case .universe: res = Array(self.universesInfo.values)
        case .galaxys: res = Array(self.galaxysInfo.values)
        case .sps: res = Array(self.spsInfo.values)
        case .spsStars:  res = Array(self.spsStartInfo.values)
        case .planets: res = Array(self.planetsInfo.values)
        }
        return res
    }
}

extension CreatorMode {
    func getChildrenNames(parentName: String, data: ElementNameForData, elemQuantity: Int = 20, page: UInt = 1) -> [String] {
        var res: [String] = []
        switch data {
        case .universe: res = self.universesNames[parentName] ?? []
        case .galaxys: res = self.universesNames[parentName] ?? []
        case .sps: res = self.galaxysNames[parentName] ?? []
        case .planets: res = self.spsNames[parentName] ?? []
        case .satellites: res = self.planetsName
        }
        return self.pageSpliter(arr: res, elemQuantity: elemQuantity, page: page)
    }
}

extension CreatorMode {
    func getInfoArr(parentName: String, data: ElementNameForData, elemQuantity: Int = 20, page: UInt = 1) -> [ElementsInfo] {
        let childrensNamesArr = self.getChildrenNames(parentName: parentName, data: data, elemQuantity: elemQuantity, page: page)
        var res: [ElementsInfo] = []
        var tempDict: [String : ElementsInfo] = [:]
        
        switch data {
        case .universe: tempDict = self.universesInfo
        case .galaxys: tempDict = self.galaxysInfo
        case .sps: tempDict = self.spsInfo
        case .planets: tempDict = self.spsStartInfo
        case .satellites: res = self.planetSatelitesInfo[parentName] != nil ? self.planetSatelitesInfo[parentName]! : []
        }
        
        for item in childrensNamesArr {
            if let d = tempDict[item] {
                res.append(d)
            }
            
            if data == .planets {
                if let d = self.planetsInfo[item] {
                    res.append(d)
                }
            }
        }
        return res
    }
}

extension CreatorMode {
    private func tickTime() {
        if self.creationTimerSec % 10 == 0 {
            for unName in self.getNames(data: .universe) {
                self.createGalaxy(unName: unName)
            }
            for glName in self.getNames(data: .galaxys) {
                self.createSPS(glName: glName)
            }
            for spsName in self.getNames(data: .sps) {
                self.createPlanet(spsName: spsName)
            }
        }
    }
}

extension CreatorMode {
    private func createUniverse() {
        let un = SingleUniverse()
        let unName = un.getUniverseInfo().name
        self.universesInfo[unName] = un.getUniverseInfo()
        self.universesInstances[unName] = un
        self.universesNames[unName] = []
    }
}

extension CreatorMode {
    private func createGalaxy(unName: String) {
        let gl = SingleGalaxy()
        let glName = gl.getGalaxyInfo().name
        self.galaxysInfo[glName] = gl.getGalaxyInfo()
        self.galaxysInstances[glName] = gl
        self.galaxysNames[glName] = []
        self.universesNames[unName]?.append(glName)
    }
}

extension CreatorMode {
    private func createSPS(glName: String) {
        let sps = SingleStarPlanetSystem(maxPlnQ: self.maxQofPlanest)
        let spsName = sps.getSPSInfo().name
        self.spsInstances[spsName] = sps
        self.spsInfo[spsName] = sps.getSPSInfo()
        self.spsNames[spsName] = []
        self.spsStarNames.append(sps.getStarInfo().name)
        self.spsNames[spsName]?.append(sps.getStarInfo().name)
        self.spsStartInfo[sps.getStarInfo().name] = sps.getStarInfo()
        self.galaxysNames[glName]?.append(spsName)
        sps.addPlanet()
    }
}

extension CreatorMode {
    private func createPlanet(spsName: String) {
        let pl = SinglePlanet()
        let plInfo = pl.getPlanetInfo()
        self.planetsName.append(plInfo.name)
        self.planetsInfo[plInfo.name] = plInfo
        self.planetSatelitesInfo[plInfo.name] = pl.getPlanetSatelites()
        self.spsNames[spsName]?.append(plInfo.name)
    }
}
