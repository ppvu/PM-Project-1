//
//  Universe.swift
//  MyUniverseApp
//
//  Created by spezza on 25.01.2021.
//

import Foundation

struct UNInfo {
    var name: String
    var age: Int
}
// класс вселенной



final class SingleUniverse {
    
   
    
    private var name: String
    private var lifeCicle: Int = 0
    private var age: Int = 0
    private var info: UNInfo
    
    init () {
        self.name = nameGenerator(prefix: "UN", length: 5)
        self.info = UNInfo(name: self.name, age: self.age)
    }
    // возвращаем инфу о вселенной
    func getUniverseInfo() -> UNInfo {
        return info
    }
    func addTime(timeSec: Int) {
        self.age = timeSec
    }
}
