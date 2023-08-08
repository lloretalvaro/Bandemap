//
//  RemoteDataSourceTests.swift
//  BandemapTests
//
//  Created by Lloret López álvaro on 8/8/23.
//

import XCTest
@testable import Bandemap

final class RemoteDataSourceTests: XCTestCase {
    
    var sut: RemoteDataSourceProtocol?
    let apiKey: String = "2d296f45cb294e1aa1a6a873e2961df7"
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [URLProtocolMock.self]
        // Inyectamos la configuración nuestra al mock
        let mockURLSession = URLSession.init(configuration: configuration)
        sut = RemoteDataSourceImpl(session: mockURLSession)
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        try super.tearDownWithError()
    }

    func testRemoteDataSource_whenGetGeocodingInfoWithSuccessResult_expectGeocodingInfo() async throws{
        // Le metemos el request handler con status code y la data que queramos
        URLProtocolMock.requestHandler = { request in
            let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            let geocodingInfo = GeocodingInfo(documentation: nil, licenses: nil, rate: nil, results: [
                Result(annotations: Annotations(dms: nil, mgrs: nil, maidenhead: nil, mercator: nil, nuts: nil, osm: nil, unM49: nil, callingcode: 34, currency: Currency(alternateSymbols: nil, decimalMark: nil, htmlEntity: nil, isoCode: nil, isoNumeric: nil, name: "Euro", smallestDenomination: nil, subunit: nil, subunitToUnit: nil, symbol: "€", symbolFirst: nil, thousandsSeparator: nil, disambiguateSymbol: nil), flag: "🇪🇸", geohash: nil, qibla: nil, roadinfo: Roadinfo(driveOn: "right", speedIn: "km/h"), sun: nil, timezone: nil, what3Words: nil, wikidata: nil, fips: nil), bounds: nil, components: Components(iso31661_Alpha2: nil, iso31661_Alpha3: nil, iso31662: nil, category: nil, type: nil, city: "Madrid", continent: "Europe", country: "Spain", countryCode: nil, politicalUnion: nil, state: nil, stateCode: nil, administrative: nil, county: nil, town: nil, region: nil, stateDistrict: nil, hamlet: nil, postcode: nil), confidence: nil, formatted: "Madrid, Spain", geometry: Geometry(lat: 40.4167047, lng: -3.7035825))
            ], status: StatusInfo(code: 200, message: "OK"), stayInformed: nil, thanks: nil, timestamp: nil, totalResults: 1)
            
            let data = try JSONEncoder().encode(geocodingInfo) // Requiere cambiar hero a Encodable --> Decodable + Encodable = Codable
            return (response, data)
        }
        
        // WHEN
        guard let geocodingInfo = try? await sut?.getGeocodingInfo(locationDescription: "madrid,spain") else {
            XCTFail("Geocoding info must contain a GeocodingInfo")
            return
        }
        
        // THEN
        XCTAssertNotNil(geocodingInfo.results)
        XCTAssertEqual(geocodingInfo.results?[0].formatted, "Madrid, Spain")
    }

}
