//
//  API.swift
//  MyUniverseApp
//
//  Created by spezza on 18.01.2021.
//

import Foundation

final class API {
    
    var maxQofPlanest: Int = 9
    var api: CreatorMode = CreatorMode()
    
    init() {
        Timer.scheduledTimer(withTimeInterval: 10.0, repeats: true) { timer in
            self.api.getNames(data: .sps, elemQuantity: 100)
        }
    }
}
