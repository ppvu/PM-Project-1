//
//  InstanceStruct.swift
//  MyUniverseApp
//
//  Created by spezza on 09.02.2021.
//

import Foundation

struct Instance {
    var universesInstances: [String: SingleUniverse] = [:]
    var galaxysInstances: [String: SingleGalaxy] = [:]
    var spsInstances: [String: SingleStarPlanetSystem] = [:]
}
