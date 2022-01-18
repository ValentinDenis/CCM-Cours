//
//  DogFactResponse.swift
//  CCM Cours
//
//  Created by Valentin Denis on 18/01/2022.
//

import Foundation

struct DogFactResponse: Codable {
    let facts: [String]?
    let success: Bool?
}
