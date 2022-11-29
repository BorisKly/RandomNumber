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

    private let cache = NSCache<NSString, AnyObject>()

    private let urlSearch = "http://numbersapi.com/"


    // MARK: - Init Properties

    private init() {}

    // MARK: - Public Methods

    public func resultOfNumberSearch(dataR: String, onSuccess: @escaping (NumberFactsData) -> Void, onError: (Error) -> Void) {
        guard let url = URL(string: urlSearch + "\(dataR)?json=") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url ) { (data, _, _) in
            guard let data = data,
                  let jsonString = try? JSONDecoder().decode(NumberFactsResponseData.self, from: data) else {print("Error - cannot get information from url"); return}
            let viewData = NumberFactsData(
                text: jsonString.text,
                number: jsonString.number)
            onSuccess(viewData)
        }
        task.resume()
     }

//    public func fetchImage(imageCoverID: Int, size: Covers, onSuccess: @escaping (Data?) -> Void ) {
//        let key = NSString(string: "\(imageCoverID) \(size.rawValue)")
//        if let image = cache.object(forKey: key) {
//            onSuccess(image.image)
//            return
//        }
//
//        let API = urlCover + String(imageCoverID) + size.rawValue
//        guard  let apiURL = URL(string: API) else {
//            onSuccess(nil)
//            return
//        }
//        let task = URLSession.shared.dataTask(with: apiURL) { [weak self] (data, _, error) in
//            guard let dataN =  data, error == nil else {
//                onSuccess(nil)
//                return
//            }
//            self?.cache.setObject(ImageData(dataN), forKey: key)
//            onSuccess(dataN)
//        }
//        task.resume()
//    }

}

