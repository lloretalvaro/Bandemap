//
//  ListViewModelTests.swift
//  BandemapTests
//
//  Created by Lloret López álvaro on 10/8/23.
//

import XCTest
@testable import Bandemap

final class ListViewModelTests: XCTestCase {

    var sut: ListViewModel?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        let remoteDataSource = RemoteDataSourceImpl()
        let localDataSource = LocalDataSourceImpl()
        let repository = RepositoryImpl(remoteDataSource: remoteDataSource, localDataSource: localDataSource)
       
        sut = ListViewModel(repository: repository)
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testListViewModel_whenInitCountriesSuccesful_expectCountries() throws {
        let expectation = expectation(description: "Countries with some value")
        
        sut?.initCountries(){
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
        
        print(sut?.countries)
        XCTAssertNotNil(sut?.countries)
    }

}
