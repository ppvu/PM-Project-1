//
//  Universe.swift
//  MyUniverseApp
//
//  Created by spezza on 25.01.2021.
//

import Foundation

// MARK: - Struct for all Space objects
struct ElementsInfo {
    var name: String
    var description: String
}

final class SingleUniverse {
    
    var name: String
    private var lifeCicle: Int = 0
    var age: UInt = 0
    private var mass: Int = 0
    private var info: ElementsInfo
    
    init () {
        self.name = nameGenerator(prefix: "UN", length: 5)
        self.info = ElementsInfo(name: self.name, description: "Age: \(self.age)")
    }
}

extension SingleUniverse {
    func getUniverseInfo() -> ElementsInfo {
        return info
    }
    func addTime(timeSec: UInt) {
        self.age = timeSec
    }
    private func ageGrow() {
        age += 1
    }
}
