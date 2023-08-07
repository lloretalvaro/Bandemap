//
//  Coordinates.swift
//  Bandemap
//
//  Created by Lloret López álvaro on 7/8/23.
//

import Foundation

struct Coordinates: Codable, Identifiable {
    var id: UUID = UUID()
    let latitude: Double
    let longitude: Double
}
