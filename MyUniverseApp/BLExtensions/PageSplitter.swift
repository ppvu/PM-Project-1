//
//  PageSplitter.swift
//  MyUniverseApp
//
//  Created by spezza on 09.02.2021.
//

import Foundation

extension CreatorMode {
    func pageSpliter (arr: [String], elemQuantity: Int, page: UInt) -> [String] {
        let eq = elemQuantity == 0 ? 0 : elemQuantity - 1
        let pg = Int((Double(arr.count) / Double(elemQuantity)).rounded()) * eq
        var result: [String] = []
        if arr.count <= eq {
            result = arr
        } else if page <= 1 {
            result = Array(arr[...eq])
        } else if page > 1 {
            result = Array(arr[pg...(pg + eq)])
        }
        return result
    }
}
