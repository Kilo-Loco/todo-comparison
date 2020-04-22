//
//  SceneDelegate.swift
//  Todo Serverless Comparison
//
//  Created by Kyle Lee on 4/21/20.
//  Copyright © 2020 Kilo Loco. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = buildTodosViewController()
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    private func buildTodosViewController() -> UIViewController {
        let amplifyService = AmplifyService()
        
        let sot = TodosSourceOfTruth()
        let view = TodosView(sot: sot)
        let todosVC = TodosViewController(amplifyService: amplifyService, rootView: view)
        return todosVC
    }
}

