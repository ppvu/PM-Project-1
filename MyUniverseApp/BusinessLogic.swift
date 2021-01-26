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

//---------- Creator --------------
final class CreatorMode {
    private var history = "\n Creation history:\n"
    
    private var creationTimerSec: Int = 0
    private var creationTimerMin: Int = 0
    private var universeTime: Int = 0
    private var createdUniverses: [String: Any] = [:]
    private var createdGlaxys: [String: Any] = [:]
    private var blackHoleMass: Int = 10000
    private var blackHoleRadius: Int = 10000
    private var maxQofPlanest: Int = 9
    
    private var universesInstances: [String: SingleUniverse] = [:]
    private var galaxysInstances: [String: SingleGalaxy] = [:]
    private var spsInstances: [String: SingleStarPlanetSystem] = [:]
    
    private var universesNames: [String: [String]] = [:] // key - name of universe / value - arr of galaxys
    private var galaxysNames: [String: [String]] = [:]
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
        
//        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.universeTime += 1
            if self.creationTimerSec == 59 {
                self.creationTimerSec = 0
                self.creationTimerMin += 1
            }
            self.creationTimerSec += 1
            self.tickTime()
//        }
    }
    
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
    
    func getChildrenNames(parentName: String, data: ElementNames, elemQuantity: Int = 20, page: UInt = 1) -> [String] {
        var res: [String] = []
        switch data {
            case .universe: res = self.universesNames[parentName] ?? []
            case .galaxys: res = self.galaxysNames[parentName] ?? []
            case .sps: res = self.spsNames[parentName] ?? []
            case .spsStars: res = self.spsStarNames
            case .planets: res = self.planetsName
        }
        print("check2", parentName, data)
        return self.pageSpliter(arr: res, elemQuantity: elemQuantity, page: page)
    }
    
    func getInfoArr(parentName: String, data: ElementNames, elemQuantity: Int = 20, page: UInt = 1) -> [ElementsInfo] {
        let childrensNamesArr = self.getChildrenNames(parentName: parentName, data: data, elemQuantity: elemQuantity, page: page)
        var res: [ElementsInfo] = []
        var tempDict: [String : ElementsInfo] = [:]
    
        
        switch data {
        case .universe: tempDict = self.galaxysInfo
        case .galaxys: tempDict = self.spsInfo
        case .sps: tempDict = self.spsStartInfo
        case .spsStars: tempDict = self.planetsInfo
        case .planets: tempDict = self.planetsInfo
        }
        print("check", childrensNamesArr, self.spsInfo)
        for item in childrensNamesArr {
            
            if let d = tempDict[item] {
                res.append(d)
            }
        }
        return res
    }
    
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
    
    private func createUniverse() {
        let un = SingleUniverse()
        let unName = un.getUniverseInfo().name
        self.universesInfo[unName] = un.getUniverseInfo()
        self.universesInstances[unName] = un
        self.universesNames[unName] = []
        
    }
    private func createGalaxy(unName: String) {
        let gl = SingleGalaxy()
        let glName = gl.getGalaxyInfo().name
        self.galaxysInfo[glName] = gl.getGalaxyInfo()
        self.galaxysInstances[glName] = gl
        if self.galaxysNames.count == 0 {
            self.galaxysNames[glName] = []
            self.universesNames[unName]?.append(glName)
        } else {
            self.universesNames[unName]?.append(glName)
        }
    }
    private func createSPS(glName: String) {
        let sps = SingleStarPlanetSystem(maxPlnQ: self.maxQofPlanest)
        let spsName = sps.getSPSInfo().name
        self.spsInstances[spsName] = sps
        self.spsNames[spsName] = []
        self.spsStarNames.append(sps.getStarInfo().name)
        self.spsStartInfo[spsName] = sps.getStarInfo()
        self.galaxysNames[glName]?.append(spsName)
        sps.addPlanet()
    }
    private func createPlanet(spsName: String) {
        let pl = SinglePlanet()
        let plInfo = pl.getPlanetInfo()
        self.planetsName.append(plInfo.name)
        self.planetsInfo[plInfo.name] = plInfo
        self.planetSatelitesInfo[plInfo.name] = pl.getPlanetSatelites()
        self.spsNames[spsName]?.append(plInfo.name)
    }
}

