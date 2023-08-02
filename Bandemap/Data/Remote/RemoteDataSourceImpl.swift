//
//  RemoteDataSourceImpl.swift
//  Bandemap
//
//  Created by Lloret López álvaro on 2/8/23.
//

import Foundation


enum NetworkError: Error, Equatable {
    case malformedURL
    case noData
    case noUser
    case errorCode(Int?)
    case tokenFormat
    case decoding
    case other
}

final class RemoteDataSourceImpl: RemoteDataSourceProtocol{
    private let session: URLSession = URLSession.shared
    
    func login(withUser user: String, andPassword password: String) {
        print("login in RemoteDataSourceImpl")
    }
    
}
