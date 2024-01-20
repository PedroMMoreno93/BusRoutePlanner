//
//  SceneDelegate.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 20/01/2024.
//

import SwiftUI

class SceneDelegate: NSObject, UIWindowSceneDelegate {

    var window: UIWindow?

    // swiftlint:disable unused_optional_binding
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    // swiftlint:enable unused_optional_binding

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}
