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
    
    private let session: URLSession = URLSession.shared
    
    func login(withUser user: String, andPassword password: String) {
        print("login inside RemoteDataSourceImpl: user \(user), password \(password)")
    }
    
    
    func getGeocodingInfo(locationDescription: String) async throws -> GeocodingInfo? {
        //TODO: Make sure to test error cases
        
        let (data, _) = try await self.requestGeocodingInfo(locationDescription: locationDescription)
        let geocodingInfo = try! JSONDecoder().decode(GeocodingInfo.self, from: data)
        
        return geocodingInfo
    }
    
    
    func requestGeocodingInfo(locationDescription: String) async throws -> (Data, URLResponse) {
        //TODO: Make sure to test error cases
        let components = locationDescription.components(separatedBy: ",")
        let capital = components[0]
        let country = components[1]
        
        var locationDescriptionCleaned = locationDescription
        
        if capital.contains(" ") {
            locationDescriptionCleaned = country
        }else if country.contains(" "){
            locationDescriptionCleaned = capital
        }
        
        print(capital)
        print(country)
        print(locationDescription)
        
        let url = URL(string: "https://api.opencagedata.com/geocode/v1/json?q=\(locationDescriptionCleaned)&key=\(apiKey)")!
        let (data, urlResponse) = try await URLSession.shared.data(from: url)
        return (data, urlResponse)
    }
    
}
