//
//  RepositoryTests.swift
//  BandemapTests
//
//  Created by Lloret López álvaro on 8/8/23.
//

import XCTest
@testable import Bandemap

final class RepositoryTests: XCTestCase {

    
    var sut: RepositoryProtocol?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        let remoteDataSource = RemoteDataSourceMock()
        sut = RepositoryImpl(remoteDataSource: remoteDataSource, localDataSource: LocalDataSourceImpl())
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }


    func testRepository_whenGetGeocodingInfoWithMockRemoteGetGeocodingInfoFail_expectError() async throws {
        do{
            let geocodingInfo = try await sut?.getGeocodingInfo(locationDescription: "")
            
        }catch {
            print("It entered the catch block")
            XCTAssertEqual(error as? NetworkError, NetworkError.malformedURL)
        }
    }
    
    
    func testRepository_whenGetGeocodingInfoWithMockRemoteGetGeocodingInfoSuccessful_expectGeocodingInfo() async throws {
        do{
            let mockRemoteDataSource = RemoteDataSourceMock(geocodingInfoSuccess: true)
            sut = RepositoryImpl(remoteDataSource: mockRemoteDataSource, localDataSource: LocalDataSourceImpl())
            
            let geocodingInfo = try await sut?.getGeocodingInfo(locationDescription: "")
            XCTAssertNotNil(geocodingInfo)
        }catch {
            XCTFail("No error should be thrown in this successful case")
        }
    }
    

}
