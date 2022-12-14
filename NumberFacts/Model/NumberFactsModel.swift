//
//  NumberFactsModel.swift
//  RandomNumber
//
//  Created by Boris Klykavka on 29.11.2022.
//

import Foundation


class NumberFactsModel {

    // MARK: - Public Properties

    public var jsonArray: [NumberFactsData?] = []

    // MARK: Public Methods

    public func setNumberFactsModel(data : String, onSuccess: @ escaping () -> Void) {
        NetworkManager.shared.resultOfNumberSearch(dataR: data, onSuccess:  { [weak self] json in
            self?.jsonArray.insert(json, at: 0)
            DispatchQueue.main.async {
                onSuccess()
            }
        }, onError: { print($0)} )
    }
}
