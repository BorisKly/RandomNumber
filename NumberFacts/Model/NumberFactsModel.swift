//
//  NumberFactsModel.swift
//  RandomNumber
//
//  Created by Boris Klykavka on 29.11.2022.
//

import Foundation


class NumberFactsModel {

    public var jsonB : NumberFactsData?

    public func setNumberFactsModel(data : String, onSuccess: @ escaping () -> Void) {
        NetworkManager.shared.resultOfNumberSearch(dataR: data, onSuccess:  { [weak self] json in
            self?.jsonB = json
            DispatchQueue.main.async {
                onSuccess()
            }
        }, onError: { print($0)} )
    }

}
