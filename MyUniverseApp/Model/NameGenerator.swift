//
//  NameGenerator.swift
//  MyUniverseApp
//
//  Created by spezza on 25.01.2021.
//

import Foundation

func nameGenerator(prefix: String, length: Int = 1) -> String{
    enum s {
        static let c = Array("ABCDEFGHJKLMNOPQRSTUVWXYZ12345789")
        static let k = UInt32(c.count)
    }
    var resultName = [Character](repeating: "-", count: length)
    for i in 0..<length {
        let r = Int(arc4random_uniform(s.k))
        resultName[i] = s.c[r]
    }
    return prefix + "-" + String(resultName)
}
