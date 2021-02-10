//
//  InfoStruct.swift
//  MyUniverseApp
//
//  Created by spezza on 09.02.2021.
//

import Foundation

struct Info {
    var universesInfo: [String: ElementsInfo] = [:]
    var galaxysInfo: [String: ElementsInfo] = [:]
    var spsInfo: [String: ElementsInfo] = [:]
    var spsStartInfo: [String: ElementsInfo] = [:]
    var planetsInfo: [String: ElementsInfo] = [:]
    var planetSatelitesInfo: [String: [ElementsInfo]] = [:]
}
