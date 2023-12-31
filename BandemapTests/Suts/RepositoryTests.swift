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
        let localDataSource = LocalDataSourceMock()
        sut = RepositoryImpl(remoteDataSource: remoteDataSource, localDataSource: localDataSource)
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
            sut = RepositoryImpl(remoteDataSource: mockRemoteDataSource, localDataSource: LocalDataSourceMock())
            
            let geocodingInfo = try await sut?.getGeocodingInfo(locationDescription: "")
            XCTAssertNotNil(geocodingInfo)
        }catch {
            XCTFail("No error should be thrown in this successful case")
        }
    }
    
    func testRepository_whenGetCountriesWithMockLocalGetCountriesFail_expectNil() async throws {
        do{
            let countries = try await sut?.getCountries()
            XCTAssertNil(countries)
        }catch {
            XCTFail("No error should be thrown in this successful case")
        }
    }
    
    func testRepository_whenGetCountriesWithMockLocalGetCountriesSuccessful_expectCountries() async throws {
        do{
            let mockLocalDataSource = LocalDataSourceMock(countriesSuccess: true)
            sut = RepositoryImpl(remoteDataSource: RemoteDataSourceMock(), localDataSource: mockLocalDataSource)
            
            let countries = try await sut?.getCountries()
            XCTAssertNotNil(countries)
        }catch {
            XCTFail("No error should be thrown in this successful case")
        }
    }
    
}
