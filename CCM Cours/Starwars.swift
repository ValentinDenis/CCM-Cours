//
//  Starwars.swift
//  CCM Cours
//
//  Created by Valentin Denis on 18/01/2022.
//

import Foundation

protocol SWApiObject {
    var name: String? { get set }
}

struct People: SWApiObject {
    var name: String?
    let surname: String?
}

struct Planet: SWApiObject {
    var name: String?
    let circumference: Double?
}

struct Starship: SWApiObject {
    var name: String?
    let size: Double?
}
