//
//  NumberFactsResponseData.swift
//  RandomNumber
//
//  Created by Boris Klykavka on 29.11.2022.
//

import Foundation

struct NumberFactsResponseData: Codable {
    let text: String
    let number: Int
    let found: Bool
    let type: String
}
//
