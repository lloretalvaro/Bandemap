//
//  LocalDataSourceImpl.swift
//  Bandemap
//
//  Created by Lloret López álvaro on 3/8/23.
//

import Foundation

final class LocalDataSourceImpl: LocalDataSourceProtocol {
    
    
    func getCountries() async throws -> [Country]? {
        return [Country(country: "Italy", capital: "Rome", flag: "🇮🇹")]
    }
    
    
}
