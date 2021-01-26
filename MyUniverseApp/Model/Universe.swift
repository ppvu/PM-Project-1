//
//  Universe.swift
//  MyUniverseApp
//
//  Created by spezza on 25.01.2021.
//

import Foundation

protocol ElementsInfo {
    var name: String { get set }
    var age: UInt { get set }
}

struct UNInfo: ElementsInfo {
    var name: String
    var age: UInt
}
// класс вселенной



final class SingleUniverse {
    
   
    
    private var name: String
    private var lifeCicle: Int = 0
    private var age: UInt = 0
    private var info: UNInfo
    
    init () {
        self.name = nameGenerator(prefix: "UN", length: 5)
        self.info = UNInfo(name: self.name, age: self.age)
    }
    // возвращаем инфу о вселенной
    func getUniverseInfo() -> UNInfo {
        return info
    }
    func addTime(timeSec: UInt) {
        self.age = timeSec
    }
}
