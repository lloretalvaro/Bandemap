//
//  RepositoryProtocol.swift
//  Bandemap
//
//  Created by Lloret López álvaro on 2/8/23.
//

import Foundation

protocol RepositoryProtocol {
    func login(withUser user: String, andPassword password: String)
    func getGeocodingInfo(locationDescription: String) async throws -> GeocodingInfo?
    func getCountries() async throws -> [Country]?
}
