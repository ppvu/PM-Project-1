//
//  Galaxy.swift
//  MyUniverseApp
//
//  Created by spezza on 25.01.2021.
//

import Foundation

enum GalaxyType: String, CaseIterable {
    case irregular = "Irregular"
    case elliptical = "Elliptical"
    case spiral = "Spiral"
}

struct GLInfo {
    var name: String
    var age: Int
}
// класс галактика
final class SingleGalaxy {
    
    
    
    private var name: String
    private var lifeCicle: Int = 0
    private var age: Int = 0
    private var maxQofPlanest: Int
    private var info: GLInfo
    
    init () {
        self.maxQofPlanest = 9
        self.name = nameGenerator(prefix: "GL", length: 5)
        self.info = GLInfo(name: self.name, age: self.age)
    }
    // возвращаем инфу о галактике
    func getGalaxyInfo() -> GLInfo {
        return info
    }
    func addTime(timeSec: Int) {
        self.age = timeSec
    }
}
