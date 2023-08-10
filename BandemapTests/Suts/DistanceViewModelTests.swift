//
//  DistanceViewModelTests.swift
//  BandemapTests
//
//  Created by Lloret López álvaro on 9/8/23.
//

import XCTest
@testable import Bandemap

final class DistanceViewModelTests: XCTestCase {

    var sut: DistanceViewModel?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        let remoteDataSource = RemoteDataSourceImpl()
        let localDataSource = LocalDataSourceImpl()
        let repository = RepositoryImpl(remoteDataSource: remoteDataSource, localDataSource: localDataSource)
       
        sut = DistanceViewModel(repository: repository)
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testDistanceViewModel_whenGetGeocodingInfoFail_expectError() throws {
        do {
            let distance = try sut?.calculateDistance(capital1: "Madrid", capital2: "Lisbon")
    
        }catch{
            XCTAssertEqual(error as? DistanceError, DistanceError.notCountryFound)
        }
        
    }
    
    func testDistanceViewModel_whenGetGeocodingInfoWithSuccessResult_expectGeocodingInfo() throws {
        do {
            sut?.countries = [Country(country: "Portugal", capital: "Lisbon", flag: "🇵🇹", coordinates: Coordinates(latitude: 38.7077507, longitude: -9.1365919)),
                              Country(country: "Spain", capital: "Madrid", flag: "🇪🇸", coordinates: Coordinates(latitude: 40.4167047, longitude: -3.7035825))]
            let distance = try sut?.calculateDistance(capital1: "Madrid", capital2: "Lisbon")
            print(distance)
            XCTAssertNotNil(distance)
            XCTAssertEqual(distance, 503)
            
        }catch{
            XCTFail("No error should be thrown in this successful case")
        }
    }

    func testDistanceViewModel_whenInitCountriesAndCapitalsSuccesful_expectCountriesAndCapital(){
      
        let expectation = expectation(description: "Countries and capitals with some value")
        
        sut?.initCountriesAndCapitals(){
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
        
        print(sut?.countries)
        print(sut?.capitals)
        XCTAssertNotNil(sut?.countries)
        XCTAssertNotNil(sut?.capitals)
    }
   

}
