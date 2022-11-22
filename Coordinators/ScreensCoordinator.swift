//
//  ScreensCoordinator.swift
//  RandomNumber
//
//  Created by Boris Klykavka on 21.11.2022.
//

import UIKit

enum AvailableScreens {
    case randomNumber
    case explicitRandomNumber
}

final class ScreensCoordinator: Coordinator {

    var navigationController: UINavigationController

    private var navigationScreens: [AvailableScreens] = []

    // MARK: -
    // MARK: Init and Deinit

    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    public func startVC() {
        self.jumpToScreen(.randomNumber)
    }
    // MARK: -
    // MARK: Methods

    private func first() {
        let controller =
            NumberFactsViewController.startVC()
        print("ssss")
        self.navigationController.pushViewController(controller, animated: true)
    }

    private func second() {
        let controller =
            NumberFactsViewController.startVC()
        self.navigationController.pushViewController(controller, animated: true)
    }
}

// MARK: -
// MARK: Extensions

extension ScreensCoordinator {
    public func jumpToScreen(_ jumpTo: AvailableScreens) {
        switch jumpTo {
        case .randomNumber:
            self.first()

        case .explicitRandomNumber:
            self.second()
        }
    }
}


