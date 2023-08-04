//
//  BandemapApp.swift
//  Bandemap
//
//  Created by Lloret López álvaro on 1/8/23.
//

import SwiftUI

@main
struct BandemapApp: App {
    var body: some Scene {
        WindowGroup {
            let remoteDataSource = RemoteDataSourceImpl()
            let localDataSource = LocalDataSourceImpl()
            let repository = RepositoryImpl(remoteDataSource: remoteDataSource, localDataSource: localDataSource)
            RootView()
                .environmentObject(RootViewModel(repository: repository))
        }
    }
}
