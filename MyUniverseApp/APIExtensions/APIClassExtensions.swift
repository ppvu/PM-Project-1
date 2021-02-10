//
//  APIClassExtensions.swift
//  MyUniverseApp
//
//  Created by spezza on 09.02.2021.
//

import Foundation

extension API {
    func getUNNamesList() -> [ElementsInfo] {
        let res = self.api.getUnInfo(data: .universe, elemQuantity: 100, page: 1)
        return res
    }
    
    func getChildrenNamesList(parentName: String, data: ElementNameForData, elemQuantity: Int, page: UInt) -> [ElementsInfo] {
        return self.api.getInfoArr(parentName: parentName , data: data, elemQuantity: elemQuantity, page: page)
    }
    
    func timeTick() {
        self.api.time()
    }
}
