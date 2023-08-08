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
    case badFormat
    case decoding
    case other
}

final class RemoteDataSourceImpl: RemoteDataSourceProtocol {
    
    let apiKey: String = "2d296f45cb294e1aa1a6a873e2961df7"
    
    private let session: NetworkFetchingProtocol
    private let server: String = "https://api.opencagedata.com"
    
    init(session: NetworkFetchingProtocol = URLSession.shared) {
        self.session = session
    }
    
    
    func login(withUser user: String, andPassword password: String) {
        print("LOG: login inside RemoteDataSourceImpl: user \(user), password \(password)")
    }
    
    
    func getGeocodingInfo(locationDescription: String) async throws -> GeocodingInfo? {
        
        let (data, _) = try await self.requestGeocodingInfo(locationDescription: locationDescription)
        do {
            let geocodingInfo = try JSONDecoder().decode(GeocodingInfo.self, from: data)
            return geocodingInfo
        }catch{
            throw NetworkError.badFormat
        }
    }
    
    
    func requestGeocodingInfo(locationDescription: String) async throws -> (Data, URLResponse) {
    
        let locationDescriptionCleaned = locationDescription.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        print("---------")
        print(locationDescription)
        print(locationDescriptionCleaned!)
        print("---------")
        
        do{
            let url = URL(string: "\(server)/geocode/v1/json?q=\(locationDescriptionCleaned!)&language=en&key=\(apiKey)")!
            let (data, urlResponse) = try await session.data(url: URLRequest(url: url))
            return (data, urlResponse)
        }catch{
            throw NetworkError.malformedURL
        }
        
    }
    
}
