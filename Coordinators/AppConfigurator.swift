//
//  AppConfigurator.swift
//  RandomNumber
//
//  Created by Boris Klykavka on 21.11.2022.
//

import UIKit

final class AppConfigurator {

    private var coordinator: Coordinator?

    init(window: UIWindow) {
        self.configure(window: window)
    }

    private func configure(window: UIWindow) {
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        navigationController.navigationBar.isHidden = true
        self.coordinator = ScreensCoordinator(navigationController: navigationController)
        self.coordinator?.startVC()
        window.makeKeyAndVisible()
    }
}


