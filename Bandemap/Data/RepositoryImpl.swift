//
//  RepositoryImpl.swift
//  Bandemap
//
//  Created by Lloret López álvaro on 2/8/23.
//

import Foundation

final class RepositoryImpl: RepositoryProtocol {
    
    private let remoteDataSource: RemoteDataSourceProtocol
    private let localDataSource: LocalDataSourceProtocol

    init(remoteDataSource: RemoteDataSourceProtocol, localDataSource: LocalDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }
    
    func login(withUser user: String, andPassword password: String) {
        print("login inside RepositoryImpl: user \(user), password \(password)")
        print("...using remoteDataSource now...")
        
        remoteDataSource.login(withUser: user, andPassword: password)
        
    }
    
    func getGeocodingInfo() async throws -> GeocodingInfo? {
        return try? await remoteDataSource.getGeocodingInfo()
    }
    
    func getCountries() async throws -> [Country]? {
        return try? await localDataSource.getCountries()
    }
    
    
}
