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
    var creation = Creation()
    var instances = Instance()
    var objectNames = Names()
    var objectInfo = Info()
    var defaultsForPageSplitter = DefaultsForPageSplitter()
    
    init() { self.createUniverse() }
    
    func time() {
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.creation.universeTime += 1
            if self.creation.creationTimerSec == 59 {
                self.creation.creationTimerSec = 0
                self.creation.creationTimerMin += 1
            }
            self.creation.creationTimerSec += 1
            self.tickTime()
        }
    }
}

