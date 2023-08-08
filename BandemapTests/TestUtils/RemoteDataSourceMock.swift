//
//  RemoteDataSourceMock.swift
//  BandemapTests
//
//  Created by Lloret López álvaro on 8/8/23.
//

import Foundation
@testable import Bandemap

final class RemoteDataSourceMock: RemoteDataSourceProtocol {
    
    let geocodingInfoSuccess: Bool
    
    init(geocodingInfoSuccess: Bool = false) {
        self.geocodingInfoSuccess = geocodingInfoSuccess
    }
    
    
    func getGeocodingInfo(locationDescription: String) async throws -> Bandemap.GeocodingInfo? {
        print("geocodingInfoSuccess is \(geocodingInfoSuccess)")
        switch geocodingInfoSuccess {
        case true:
            return getEmptyStubGeocodingInfo()
        case false:
            throw NetworkError.malformedURL
        }
    }
    
    func login(withUser user: String, andPassword password: String) {
        print("Login in the mock remote datasource")
    }
    
    private func getEmptyStubGeocodingInfo() -> GeocodingInfo {
        return GeocodingInfo(documentation: nil, licenses: nil, rate: nil, results: [], status: StatusInfo(code: 200, message: "OK"), stayInformed: nil, thanks: nil, timestamp: nil, totalResults: 0)
    }
    
}
