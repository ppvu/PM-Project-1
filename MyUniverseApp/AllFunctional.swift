//
//  AllFunctional.swift
//  MyUniverseApp
//
//  Created by spezza on 18.01.2021.
//  Проект №1
//
//  За основу берется структура:
//  - Вселенная
//  - Галактики (типы, возраст и взаимодействие друг с другом)
//  - Звездно-планетарные системы (звезда-хост, множество планет вращающихся вокруг звезды)
//  - Звезды (тип, этап эволюции, масса, температура, радиус, светимость)
//  - Планеты (тип, масса, температура, радиус)
//  - Наличие спутников (тоже планет)
//
//
//  Требования (Функциональные)
//
//  Вселенная - набор галактик
//  Галактика - набор звездно-планетарных систем.
//  Звездно-планетарные системы - набор звезд и планет
//  Звезды
//  Планеты
//  Спутники планет
//
//  Звезда инициализируется со случайными значениями своих числовых параметров (от 1 до 100) и случайным типом
//  Этапы эволюции звезды: молодая звезда, старая звезда, финальная стадия: плотный карлик либо черная дыра в зависимости от массы и радиуса (границы массы и радиуса для превращения в черную дыру задаются при инициализации вселенной)
//
//  При появлении планеты у нее создается случайное количество спутников (от 0 до 5)
//
//  - Каждые 10 секунд во вселенной появляется новая галактика (тип галактики задается случайным образом)
//  - Каждые 10 секунд в галактике появляется новая звездно-планетарная система со звездой-хостом
//  - Каждые 10 секунд в системе появляется новая планета (до 9 планет в системе)
//  - Каждые 30 секунд 2 случайно выбранные галактики возрастом более 3 минут сталкиваются
//  - Каждые 60 секунд звезда переходит на следующий этап своей эволюции
//
//  При столкновении галактик происходит их объединение в новую галактику с потерей 10% звездно-планетарных систем (системы уничтожаются случайным образом). Тип новой галактики и ее возраст равен типу и возрасту более тяжелой галактики при столкновении.
//  При превращении звезды в черную дыру звездно-планетарная система прекращает существование. При этом черная дыра остается в галактике и прекращает эволюционировать.
//  При появлении черной дыры в звездно-планетарной системе ее планеты (и их спутники) прекращают существование
//
//
//  Требования (Нефункциональные)
//
//  1. Для подсчета времени в приложении должен использоваться 1 централизованный таймер
//  2. Для передачи текущего времени вселенная использует принцип схожий с Chain Of Responsibility
//  3. Реализовать управление жизненным циклом систем с помощью машины состояний
//  4. Изменение любой подсистемы должны синхронизироваться с состоянием родительской системы
//  5. Использование многопоточности
//  6. Использование SOLID принципов
//
//
//  Требования (UI)
//
//  1. Использовать для отображения всех сущностей UICollectionView с кастомным layout (на выбор разработчика)
//  2. Каждый уровень иерархии = отдельный экран (UIViewController)
//  3. Реализовать обработку жизненного цикла текущего уровня иерархии (например его удаление). Один из примеров: пользователь находится на экране звездно-планетарной системы и в это самое время родительская галактика сталкивается с другой галактикой в результате чего текущая звездно-планетарная система случайным образом выбрана для уничтожения. Необходимо корректно реализовать это состояние с точки зрения UI (например плейсхолдер или алерт с возвратом на более высокий уровень иерархии).
//
//
//  Бонус
//
//  - Реализация функции ускорения течения времени во Вселенной
//  - Реализация функции реверса времени во Вселенной


import Foundation

//---------------------- name generator -----------------------

//---------------------- Planet -----------------------

//---------------------- Star -----------------------

//---------------------- Star-Planet System -----------------------
// инфа о звёздно планетарной системе (ЗПС)

//---------------------- Galaxy -----------------------
// инфа о галактике

//---------------------- Universe -----------------------
// инфа о вселенной


////---------- Creator --------------
//final class CreatorMode {
//    private var history = "\n Creation history:\n"
//    
//    private var creationTimerSec: Int = 0
//    private var creationTimerMin: Int = 0
//    private var universeTime: Int = 0
//    private var createdUniverses: [String: Any] = [:]
//    private var createdGlaxys: [String: Any] = [:]
//    private var blackHoleMass: Int = 10000
//    private var blackHoleRadius: Int = 10000
//    private var maxQofPlanest: Int = 9
//    
//    private var universesInstances: [String: SingleUniverse] = [:]
//    private var galaxysInstances: [String: SingleGalaxy] = [:]
//    private var spsInstances: [String: SingleStarPlanetSystem] = [:]
//    
//    private var universesNames: [String: [String]] = [:] // key - name of universe / value - arr of galaxys
//    private var galaxysNames: [String: [String]] = [:]
//    private var spsNames: [String: [String]] = [:]
//    private var spsStarNames: [String] = []
//    private var planetsName: [String] = []
//    
//    private var universesInfo: [String: UNInfo] = [:]
//    private var galaxysInfo: [String: GLInfo] = [:]
//    private var spsInfo: [String: SPSInfoS] = [:]
//    private var spsStartInfo: [String: StarInfo] = [:]
//    private var planetsInfo: [String: PlanetInfo] = [:]
//    private var planetSatelitesInfo: [String: [PlanetInfo]] = [:]
//    
//    private var defaultElementsListQ: Int = 20
//    private var defaultListPage: Int = 1
//    
//    init() {
//        self.createUniverse()
//        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
//            self.universeTime += 1
//            if self.creationTimerSec == 59 {
//                self.creationTimerSec = 0
//                self.creationTimerMin += 1
//            }
//            self.creationTimerSec += 1
//            self.tickTime()
//        }
//    }
//    
//    private func pageSpliter (arr: [String], elemQuantity: Int, page: Int) -> [String] {
//        let eq = elemQuantity - 1
//        let pg = Int((Double(arr.count) / Double(elemQuantity)).rounded()) * eq
//        var result: [String] = []
//        if arr.count <= eq {
//            result = arr
//        } else if page <= 1 {
//            result = Array(arr[...eq])
//        } else if page > 1 {
//            result = Array(arr[pg...(pg + eq)])
//        }
//        return result
//    }
//    
//    enum elementsNames {
//        case universe, galaxys, sps, spsStars, planets
//    }
//    func getNames(data: elementsNames, elemQuantity: Int = 20, page: Int = 1) -> [String] {
//        var res: [String] = []
//        switch data {
//        case .universe: res = Array(self.universesNames.keys)
//        case .galaxys: res = Array(self.galaxysNames.keys)
//        case .sps: res = Array(self.spsNames.keys)
//        case .spsStars:  res = self.spsStarNames
//        case .planets: res = self.planetsName
//        }
//        return self.pageSpliter(arr: res, elemQuantity: elemQuantity, page: page)
//    }
//    
//    private func tickTime() {
//        if self.creationTimerSec % 10 == 0 {
//            for unName in self.getNames(data: .universe) {
//                self.createGalaxy(unName: unName)
//            }
//            for glName in self.getNames(data: .galaxys) {
//                self.createSPS(glName: glName)
//            }
//            for spsName in self.getNames(data: .sps) {
//                self.createPlanet(spsName: spsName)
//            }
//        }
//    }
//    
//    private func createUniverse() {
//        let un = SingleUniverse()
//        let unName = un.getUniverseInfo().name
//        self.universesInfo[unName] = un.getUniverseInfo()
//        self.universesInstances[unName] = un
//        self.universesNames[unName] = []
//    }
//    private func createGalaxy(unName: String) {
//        let gl = SingleGalaxy()
//        let glName = gl.getGalaxyInfo().name
//        self.galaxysInfo[glName] = gl.getGalaxyInfo()
//        self.galaxysInstances[glName] = gl
//        self.galaxysNames[glName] = []
//        self.universesNames[unName] = [glName]
//    }
//    private func createSPS(glName: String) {
//        let sps = SingleStarPlanetSystem(maxPlnQ: self.maxQofPlanest)
//        let spsName = sps.getSPSInfo().name
//        self.spsInstances[spsName] = sps
//        self.spsNames[spsName] = []
//        self.spsStarNames.append(sps.getStarInfo().name)
//        self.spsStartInfo[spsName] = sps.getStarInfo()
//        self.galaxysNames[glName]?.append(spsName)
//        sps.addPlanet()
//    }
//    private func createPlanet(spsName: String) {
//        let pl = SinglePlanet()
//        let plInfo = pl.getPlanetInfo()
//        self.planetsName.append(plInfo.name)
//        self.planetsInfo[plInfo.name] = plInfo
//        self.planetSatelitesInfo[plInfo.name] = pl.getPlanetSatelites()
//        self.spsNames[spsName]?.append(plInfo.name)
//    }
//}

////=================== API ===================
//
//final class API {
//    private var blackHoleMass: Int = 10000
//    private var blackHoleRadius: Int = 10000
//    private var maxQofPlanest: Int = 9
//    private var api: CreatorMode = CreatorMode()
//    
//    init() {
//        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { timer in
////            print(self.api.getNames(data: .sps, elemQuantity: 100))
//        }
//    }
//}
//
////API()
