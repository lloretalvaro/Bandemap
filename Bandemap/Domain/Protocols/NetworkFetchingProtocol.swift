//
//  NetworkFetchingProtocol.swift
//  Bandemap
//
//  Created by Lloret López álvaro on 8/8/23.
//

import Foundation

protocol NetworkFetchingProtocol {
    func data(url: URLRequest) async throws -> (Data, URLResponse)
}
