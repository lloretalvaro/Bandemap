//
//  RepositoryImpl.swift
//  Bandemap
//
//  Created by Lloret López álvaro on 2/8/23.
//

import Foundation

final class RepositoryImpl: RepositoryProtocol {
    

    private let remoteDataSource: RemoteDataSourceProtocol
    

    init(remoteDataSource: RemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
    
    func login(withUser user: String, andPassword password: String) {
        print("login in RepositoryImpl")
        print("...using remoteDataSource now...")
        
        remoteDataSource.login(withUser: user, andPassword: password)
        
    }
    
    
}
