//
//  NetworkFetchingMock.swift
//  BandemapTests
//
//  Created by Lloret López álvaro on 8/8/23.
//


import Foundation
@testable import Bandemap

class NetworkFetchingMock: NetworkFetchingProtocol {
    
    func data(url: URLRequest) async throws -> (Data, URLResponse) {
        // Not needed as it is done with the URLProtocol
        return ("".data(using: .utf8)!,URLResponse())
    }
}
