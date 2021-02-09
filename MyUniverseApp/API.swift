//
//  API.swift
//  MyUniverseApp
//
//  Created by spezza on 18.01.2021.
//

import Foundation

final class API {
    
    private var maxQofPlanest: Int = 9
    private var api: CreatorMode = CreatorMode()
    
    init() {
        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { timer in
            print(self.api.getNames(data: .sps, elemQuantity: 100))
        }
    }
}

extension API {
    func getUNNamesList() -> [ElementsInfo] {
        let res = self.api.getUnInfo(data: .universe, elemQuantity: 100, page: 1)
        return res
    }
}

extension API {
    func getChildrenNamesList(parentName: String, data: ElementNameForData, elemQuantity: Int, page: UInt) -> [ElementsInfo] {
        return self.api.getInfoArr(parentName: parentName , data: data, elemQuantity: elemQuantity, page: page)
    }
}

extension API {
    func timeTick() {
        self.api.time()
    }
}
