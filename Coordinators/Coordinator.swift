//
//  Coordinator.swift
//  RandomNumber
//
//  Created by Boris Klykavka on 21.11.2022.
//


import UIKit

protocol Coordinator {
    var navigationController: UINavigationController {get set}

    func startVC()
}
