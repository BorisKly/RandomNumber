//
//  NetworkManager.swift
//  RandomNumber
//
//  Created by Boris Klykavka on 29.11.2022.
//

import Foundation
import UIKit
import RealmSwift

class NumbersR: Object {
    @Persisted var nimberR: Int = 0
    @Persisted var textR: String = ""
}

class NetworkManager {

    // MARK: - Public Properties

    public static let shared = NetworkManager()

    // MARK: - Private Properties

    let realm = try! Realm()

    private let urlSearch = "http://numbersapi.com/"


    // MARK: - Init Properties

    private init() {}

    // MARK: - Public Methods

    public func resultOfNumberSearch(dataR: String, onSuccess: @escaping (NumberFactsData) -> Void,  onError: @escaping (Error) -> Void) {

        guard let url = URL(string: urlSearch + "\(dataR)?json=") else {
            return
        }

        guard let keyR = Int(dataR) else {return}

        let numbersRealmArray = realm.objects(NumbersR.self)

        if let itemR = numbersRealmArray.first(where: {
            $0.nimberR == keyR
        }) {
            let viewData = NumberFactsData(text: itemR.textR, number: itemR.nimberR)
            onSuccess(viewData)
            return
        }

        let task = URLSession.shared.dataTask(with: url) { (data, responce, error) in

            if let error = error  {
                onError(error)
                return
            }

            guard let data = data,
                  let jsonString = try? JSONDecoder().decode(NumberFactsResponseData.self, from: data) else {
                print("Error - cannot get information from url");
                return
            }

            let viewData = NumberFactsData(
                text: jsonString.text,
                number: jsonString.number)

            DispatchQueue.main.async {
                let viewDataR = NumbersR()
                viewDataR.nimberR = jsonString.number
                viewDataR.textR = jsonString.text

                try! self.realm.write {
                    self.realm.add(viewDataR)
                }
            }

            onSuccess(viewData)
        }
        task.resume()
     }
}

