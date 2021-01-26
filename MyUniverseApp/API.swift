//
//  API.swift
//  MyUniverseApp
//
//  Created by spezza on 18.01.2021.
//

import Foundation

//=================== API ===================

final class API {
    private var blackHoleMass: Int = 10000
    private var blackHoleRadius: Int = 10000
    private var maxQofPlanest: Int = 9
    private var api: CreatorMode = CreatorMode()
    
    init() {
//        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { timer in
//            print(self.api.getNames(data: .sps, elemQuantity: 100))
//        }
    }

    func getUNNamesList() -> [ElementsInfo] {
        let res = self.api.getUnInfo(data: .universe, elemQuantity: 100, page: 1)
        
        return res
    }
    
//    func getGLNamesList() -> [String] {
//        return self.api.getNames(data: .universe, elemQuantity: 100, page: 1)
//    }
    
    func getChildrenNamesList(parentName: String, data: ElementNames, elemQuantity: Int, page: UInt) -> [ElementsInfo] {
        
        return self.api.getInfoArr(parentName: parentName , data: data, elemQuantity: elemQuantity, page: page)
    }
    

    func timeTick() {
        self.api.time()
    }
}

//API()
