//
//  TickTime.swift
//  MyUniverseApp
//
//  Created by spezza on 09.02.2021.
//

import Foundation

extension CreatorMode {
    func tickTime() {
        if self.creation.creationTimerSec % 10 == 0 {
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
