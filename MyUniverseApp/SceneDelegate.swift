//
//  SceneDelegate.swift
//  MyUniverseApp
//
//  Created by spezza on 14.01.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        let api = API()
        
        let viewController = MainViewController()
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            api.timeTick()
            viewController.timeTick()
        }
        
        viewController.api = api
        viewController.setData()
        viewController.type = .universe
        viewController.title = "My Universe"
        
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.prefersLargeTitles = true
        
        window.rootViewController = navigationController
        self.window = window
        window.makeKeyAndVisible()
    }
}

