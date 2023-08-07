//
//  Country.swift
//  Bandemap
//
//  Created by Lloret López álvaro on 3/8/23.
//

import Foundation

struct Country: Codable, Identifiable {
    var id: UUID = UUID()
    let country: String
    let capital: String
    let flag: String
    let coordinates: Coordinates
}

