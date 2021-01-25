//
//  State.swift
//  MyUniverseApp
//
//  Created by spezza on 18.01.2021.
//

import Foundation

protocol State {
    var description: String { get }
    
    func setCreatorState(_ CreatorState: CreatorState)
    
    func createUN()
    func createGL()
    func createSPS()
    func createPL()
}

final class UNState: State {
    let description = "createPL at \(Date()) "
    private var CreatorState: CreatorState?
    
    init() {}
    
    func setCreatorState(_ CreatorState: CreatorState) {
        self.CreatorState = CreatorState
    }
    
    func createUN() { CreatorState?.setState(GLState()) }
    func createGL() {print("--- Needs to start progress.")}
    func createSPS() { CreatorState?.setState(PLState()) }
    func createPL() {print("--- Already createPL. Do nothing.")}
}

final class GLState: State {
    let description = "In progress: \(Date()) "
    private var CreatorState: CreatorState?
    
    init() {}
    
    func setCreatorState(_ CreatorState: CreatorState) {
        self.CreatorState = CreatorState
    }
    
    func createUN() { print("--- Already in progress.") }
    func createGL() { CreatorState?.setState(SPSState()) }
    func createSPS() { print("--- Needs to be tested first.") }
    func createPL() { CreatorState?.setState(UNState()) }
}

final class SPSState: State {
    let description = "Testing: \(Date()) "
    private var CreatorState: CreatorState?
    
    init() {}
    
    func setCreatorState(_ CreatorState: CreatorState) {
        self.CreatorState = CreatorState
    }
    
    func createUN() { CreatorState?.setState(GLState()) }
    func createGL() { print("--- Already in testing.") }
    func createSPS() { CreatorState?.setState(PLState()) }
    func createPL() { print("--- Needs to be createSPS first.") }
}

final class PLState: State {
    let description = "createSPS at \(Date()) "
    private var CreatorState: CreatorState?
    
    init() {}
    
    func setCreatorState(_ CreatorState: CreatorState) {
        self.CreatorState = CreatorState
    }
    
    func createUN() { CreatorState?.setState(GLState()) }
    func createGL() { print("--- Needs to be createPL first.") }
    func createSPS() { print("--- Already createSPS.") }
    func createPL() { CreatorState?.setState(UNState()) }
}

final class CreatorState {
    var history = "\n CreatorState history:\n"
    private var state: State
    
    init() {
        state = UNState()
        state.setCreatorState(self)
        history += state.description
        print("--- \(state.description)")
    }
    
    func setState(_ state: State) {
        self.state = state
        state.setCreatorState(self)
        history += state.description
        print("--- \(state.description)")
    }
    
    func createUN() { state.createUN() }
    func createGL() { state.createGL() }
    func createSPS() { state.createSPS() }
    func createPL() { state.createPL() }
}


