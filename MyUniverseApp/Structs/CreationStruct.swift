//
//  CreationStruct.swift
//  MyUniverseApp
//
//  Created by spezza on 09.02.2021.
//

import Foundation

struct Creation {
    var history = "\n Creation history:\n"
    
    var creationTimerSec: Int = 0
    var creationTimerMin: Int = 0
    var universeTime: Int = 0
    var createdUniverses: [String: Any] = [:]
    var createdGlaxys: [String: Any] = [:]
    var maxQofPlanest: Int = 9
}
