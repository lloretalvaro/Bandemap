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
        print("LOG: login inside RepositoryImpl: user \(user), password \(password)")
        print("LOG: ...using remoteDataSource now...")
        
        remoteDataSource.login(withUser: user, andPassword: password)
    }
    
    func getGeocodingInfo(locationDescription: String) async throws -> GeocodingInfo? {
        do {
            return try await remoteDataSource.getGeocodingInfo(locationDescription: locationDescription)
        }catch{
            throw error
        }
    }
    
    func getCountries() async throws -> [Country]? {
        do {
            return try await localDataSource.getCountries()
        }catch{
            throw error
        }
    }
    
    
}
