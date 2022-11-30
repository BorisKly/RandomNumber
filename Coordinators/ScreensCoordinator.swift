//
//  ScreensCoordinator.swift
//  RandomNumber
//
//  Created by Boris Klykavka on 21.11.2022.
//

import UIKit

enum AvailableScreens {
    case randomNumberScreen
    case wideRandomNumberScreen(NumberFactsData)
}

final class ScreensCoordinator: Coordinator {

    internal var navigationController: UINavigationController

    // MARK: Private Properties

    private var navigationScreens: [AvailableScreens] = []

    // MARK: Init and Deinit

    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: Public methods

    public func startVC() {
        self.jumpToScreen(.randomNumberScreen)
    }

    // MARK: Private methods

    private func first() {
        let controller =
            NumberFactsViewController.startVC()
        controller.eventHandler = {[weak self] event in
            switch event {
            case .detailNumberFactsEvent(let numberData):
                self?.jumpToScreen(.wideRandomNumberScreen(numberData))
            }
        }
        self.navigationController.pushViewController(controller, animated: true)
    }

    private func second(number: NumberFactsData) {
        let controller = NumberFactsFullScreenViewController.startVC(numberData: number)
        controller.eventHandler = { event in
                    switch event {
                    case .backToNumberFacts:
                        self.navigationController.viewControllers.removeLast()
                    }
                }
        self.navigationController.pushViewController(controller, animated: true)
    }
}

// MARK: Extensions

extension ScreensCoordinator {
    public func jumpToScreen(_ jumpTo: AvailableScreens) {
        switch jumpTo {
        case .randomNumberScreen:
            self.first()
        case .wideRandomNumberScreen(let numberData):
            self.second(number: numberData)
        }
    }
}


