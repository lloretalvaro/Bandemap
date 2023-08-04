//
//  LocalDataSourceProtocol.swift
//  Bandemap
//
//  Created by Lloret López álvaro on 3/8/23.
//

import Foundation

protocol LocalDataSourceProtocol {
   
    func getCountries() async throws -> [Country]?

}
