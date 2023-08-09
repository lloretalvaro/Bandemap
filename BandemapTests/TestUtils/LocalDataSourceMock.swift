//
//  LocalDataSourceMock.swift
//  BandemapTests
//
//  Created by Lloret López álvaro on 9/8/23.
//

import Foundation
@testable import Bandemap

final class LocalDataSourceMock: LocalDataSourceProtocol {
    let countriesSuccess: Bool
    
    init(countriesSuccess: Bool = false) {
        self.countriesSuccess = countriesSuccess
    }
    
    func getCountries() async throws -> [Bandemap.Country]? {
        print("countriesSuccess is \(countriesSuccess)")
        switch countriesSuccess {
        case true:
            return getStubCountry()
        case false:
            return nil
        }
    }
        
    private func getStubCountry() -> [Country] {
        return [Country(country: "Spain", capital: "Madrid", flag: "🇪🇸", coordinates: Coordinates(latitude: 40.4167047, longitude: -3.7035825))]
    }
    
}

