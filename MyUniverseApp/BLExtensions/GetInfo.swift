//
//  GetInfo.swift
//  MyUniverseApp
//
//  Created by spezza on 09.02.2021.
//

import Foundation

extension CreatorMode {
    func getNames(data: ElementNames, elemQuantity: Int = 20, page: Int = 1) -> [String] {
        var res: [String] = []
        switch data {
        case .universe: res = Array(self.objectNames.universesNames.keys)
        case .galaxys: res = Array(self.objectNames.galaxysNames.keys)
        case .sps: res = Array(self.objectNames.spsNames.keys)
        case .spsStars:  res = self.objectNames.spsStarNames
        case .planets: res = self.objectNames.planetsName
        }
        return self.pageSpliter(arr: res, elemQuantity: elemQuantity, page: UInt(page))
    }
    
    func getUnInfo(data: ElementNames, elemQuantity: Int = 20, page: Int = 1) -> [ElementsInfo] {
        var res: [ElementsInfo] = []
        switch data {
        case .universe: res = Array(self.objectInfo.universesInfo.values)
        case .galaxys: res = Array(self.objectInfo.galaxysInfo.values)
        case .sps: res = Array(self.objectInfo.spsInfo.values)
        case .spsStars:  res = Array(self.objectInfo.spsStartInfo.values)
        case .planets: res = Array(self.objectInfo.planetsInfo.values)
        }
        return res
    }
    
    func getChildrenNames(parentName: String, data: ElementNameForData, elemQuantity: Int = 20, page: UInt = 1) -> [String] {
        var res: [String] = []
        switch data {
        case .universe: res = self.objectNames.universesNames[parentName] ?? []
        case .galaxys: res = self.objectNames.universesNames[parentName] ?? []
        case .sps: res = self.objectNames.galaxysNames[parentName] ?? []
        case .planets: res = self.objectNames.spsNames[parentName] ?? []
        case .satellites: res = self.objectNames.planetsName
        }
        return self.pageSpliter(arr: res, elemQuantity: elemQuantity, page: page)
    }
    
    func getInfoArr(parentName: String, data: ElementNameForData, elemQuantity: Int = 20, page: UInt = 1) -> [ElementsInfo] {
        let childrensNamesArr = self.getChildrenNames(parentName: parentName, data: data, elemQuantity: elemQuantity, page: page)
        var res: [ElementsInfo] = []
        var tempDict: [String : ElementsInfo] = [:]
        
        switch data {
        case .universe: tempDict = self.objectInfo.universesInfo
        case .galaxys: tempDict = self.objectInfo.galaxysInfo
        case .sps: tempDict = self.objectInfo.spsInfo
        case .planets: tempDict = self.objectInfo.spsStartInfo
        case .satellites: res = self.objectInfo.planetSatelitesInfo[parentName] != nil ? self.objectInfo.planetSatelitesInfo[parentName]! : []
        }
        
        for item in childrensNamesArr {
            if let d = tempDict[item] {
                res.append(d)
            }
            
            if data == .planets {
                if let d = self.objectInfo.planetsInfo[item] {
                    res.append(d)
                }
            }
        }
        return res
    }
}
