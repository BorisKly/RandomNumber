//
//  NetworkManager.swift
//  RandomNumber
//
//  Created by Boris Klykavka on 29.11.2022.
//

import Foundation
import UIKit

class NetworkManager {

    // MARK: - Public Properties

    public static let shared = NetworkManager()

    // MARK: - Private Properties

    private let cache = NSCache<NSString, NSString>()

    private let urlSearch = "http://numbersapi.com/"


    // MARK: - Init Properties

    private init() {}

    // MARK: - Public Methods

    public func resultOfNumberSearch(dataR: String, onSuccess: @escaping (NumberFactsData) -> Void, onError: (Error) -> Void) {

        guard let url = URL(string: urlSearch + "\(dataR)?json=") else {
            return
        }
        let key = NSString(string: dataR)

        if let discription = cache.object(forKey: key) {
            let viewData = NumberFactsData(text: discription as String , number: key.integerValue)
            onSuccess(viewData)
            return
        }

        let task = URLSession.shared.dataTask(with: url ) { (data, _, _) in
            guard let data = data,
                  let jsonString = try? JSONDecoder().decode(NumberFactsResponseData.self, from: data) else {
                print("Error - cannot get information from url");
                return
            }
            let viewData = NumberFactsData(
                text: jsonString.text,
                number: jsonString.number)

            self.cache.setObject(viewData.text as NSString, forKey: String(viewData.number) as NSString)

            onSuccess(viewData)
        }
        task.resume()


     }
}

