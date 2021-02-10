//
//  Universe.swift
//  MyUniverseApp
//
//  Created by spezza on 25.01.2021.
//

import Foundation

// MARK: - Protocol for all Space objects
struct ElementsInfo {
    var name: String
    var description: String
//    var mass: Int { get set }
}
// MARK: - Universe struct
//struct UNInfo: ElementsInfo {
//    var name: String
//    var description: String
//
////    var age: UInt
////    var mass: Int
//}

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
    // Return info about Universe
    func getUniverseInfo() -> ElementsInfo {
        return info
    }
    func addTime(timeSec: UInt) {
        self.age = timeSec
    }
}
