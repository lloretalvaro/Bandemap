//
//  GeocodingInfo.swift
//  Bandemap
//
//  Created by Lloret López álvaro on 2/8/23.
//

import Foundation

// This file includes the needed structs to parse the response that my API is returning.
// Link to the API I'm using: https://opencagedata.com/api


// MARK: - GeocodingInfo
struct GeocodingInfo: Codable {
    let documentation: String?
    let licenses: [License]?
    let rate: Rate?
    let results: [Result]?
    let status: StatusInfo?
    let stayInformed: StayInformed?
    let thanks: String?
    let timestamp: Timestamp?
    let totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case documentation, licenses, rate, results, status
        case stayInformed = "stay_informed"
        case thanks, timestamp
        case totalResults = "total_results"
    }
}

// MARK: - License
struct License: Codable {
    let name: String?
    let url: String?
}

// MARK: - Rate
struct Rate: Codable {
    let limit, remaining, reset: Int?
}

// MARK: - Result
struct Result: Codable {
    let annotations: Annotations?
    let bounds: Bounds?
    let components: Components?
    let confidence: Int?
    let formatted: String?
    let geometry: Geometry?
}

// MARK: - Annotations
struct Annotations: Codable {
    let dms: Dms?
    let mgrs, maidenhead: String?
    let mercator: Mercator?
    let nuts: Nuts?
    let osm: Osm?
    let unM49: UnM49?
    let callingcode: Int?
    let currency: Currency?
    let flag, geohash: String?
    let qibla: Double?
    let roadinfo: Roadinfo?
    let sun: Sun?
    let timezone: Timezone?
    let what3Words: What3Words?
    let wikidata: String?
    let fips: FIPS?

    enum CodingKeys: String, CodingKey {
        case dms = "DMS"
        case mgrs = "MGRS"
        case maidenhead = "Maidenhead"
        case mercator = "Mercator"
        case nuts = "NUTS"
        case osm = "OSM"
        case unM49 = "UN_M49"
        case callingcode, currency, flag, geohash, qibla, roadinfo, sun, timezone
        case what3Words = "what3words"
        case wikidata
        case fips = "FIPS"
    }
}

// MARK: - Currency
struct Currency: Codable {
    let alternateSymbols: [String]?
    let decimalMark, htmlEntity, isoCode, isoNumeric: String?
    let name: String?
    let smallestDenomination: Int?
    let subunit: String?
    let subunitToUnit: Int?
    let symbol: String?
    let symbolFirst: Int?
    let thousandsSeparator, disambiguateSymbol: String?

    enum CodingKeys: String, CodingKey {
        case alternateSymbols = "alternate_symbols"
        case decimalMark = "decimal_mark"
        case htmlEntity = "html_entity"
        case isoCode = "iso_code"
        case isoNumeric = "iso_numeric"
        case name
        case smallestDenomination = "smallest_denomination"
        case subunit
        case subunitToUnit = "subunit_to_unit"
        case symbol
        case symbolFirst = "symbol_first"
        case thousandsSeparator = "thousands_separator"
        case disambiguateSymbol = "disambiguate_symbol"
    }
}

// MARK: - Dms
struct Dms: Codable {
    let lat, lng: String?
}

// MARK: - FIPS
struct FIPS: Codable {
    let county, state: String?
}

// MARK: - Mercator
struct Mercator: Codable {
    let x, y: Double?
}

// MARK: - Nuts
struct Nuts: Codable {
    let nuts0, nuts1, nuts2, nuts3: NUTS0Class?

    enum CodingKeys: String, CodingKey {
        case nuts0 = "NUTS0"
        case nuts1 = "NUTS1"
        case nuts2 = "NUTS2"
        case nuts3 = "NUTS3"
    }
}

// MARK: - NUTS0Class
struct NUTS0Class: Codable {
    let code: String?
}

// MARK: - Osm
struct Osm: Codable {
    let editURL, noteURL, url: String?

    enum CodingKeys: String, CodingKey {
        case editURL = "edit_url"
        case noteURL = "note_url"
        case url
    }
}

// MARK: - Roadinfo
struct Roadinfo: Codable {
    let driveOn, speedIn: String?

    enum CodingKeys: String, CodingKey {
        case driveOn = "drive_on"
        case speedIn = "speed_in"
    }
}

// MARK: - Sun
struct Sun: Codable {
    let rise, sunSet: Rise?

    enum CodingKeys: String, CodingKey {
        case rise
        case sunSet = "set"
    }
}

// MARK: - Rise
struct Rise: Codable {
    let apparent, astronomical, civil, nautical: Int?
}

// MARK: - Timezone
struct Timezone: Codable {
    let name: String?
    let nowInDst, offsetSEC: Int?
    let offsetString, shortName: String?

    enum CodingKeys: String, CodingKey {
        case name
        case nowInDst = "now_in_dst"
        case offsetSEC = "offset_sec"
        case offsetString = "offset_string"
        case shortName = "short_name"
    }
}

// MARK: - UnM49
struct UnM49: Codable {
    let regions: Regions?
    let statisticalGroupings: [String]?

    enum CodingKeys: String, CodingKey {
        case regions
        case statisticalGroupings = "statistical_groupings"
    }
}

// MARK: - Regions
struct Regions: Codable {
    let es, europe, southernEurope, world: String?
    let americas, northernAmerica, us, co: String?
    let latinAmerica, southAmerica, asia, ph: String?
    let southeastAsia: String?

    enum CodingKeys: String, CodingKey {
        case es = "ES"
        case europe = "EUROPE"
        case southernEurope = "SOUTHERN_EUROPE"
        case world = "WORLD"
        case americas = "AMERICAS"
        case northernAmerica = "NORTHERN_AMERICA"
        case us = "US"
        case co = "CO"
        case latinAmerica = "LATIN_AMERICA"
        case southAmerica = "SOUTH_AMERICA"
        case asia = "ASIA"
        case ph = "PH"
        case southeastAsia = "SOUTHEAST_ASIA"
    }
}

// MARK: - What3Words
struct What3Words: Codable {
    let words: String?
}

// MARK: - Bounds
struct Bounds: Codable {
    let northeast, southwest: Geometry?
}

// MARK: - Geometry
struct Geometry: Codable {
    let lat, lng: Double?
}

// MARK: - Components
struct Components: Codable {
    let iso31661_Alpha2, iso31661_Alpha3: String?
    let iso31662: [String]?
    let category, type, city, continent: String?
    let country, countryCode, politicalUnion, state: String?
    let stateCode, administrative, county, town: String?
    let region, stateDistrict, hamlet, postcode: String?

    enum CodingKeys: String, CodingKey {
        case iso31661_Alpha2 = "ISO_3166-1_alpha-2"
        case iso31661_Alpha3 = "ISO_3166-1_alpha-3"
        case iso31662 = "ISO_3166-2"
        case category = "_category"
        case type = "_type"
        case city, continent, country
        case countryCode = "country_code"
        case politicalUnion = "political_union"
        case state
        case stateCode = "state_code"
        case administrative, county, town, region
        case stateDistrict = "state_district"
        case hamlet, postcode
    }
}

// MARK: - StatusInfo
struct StatusInfo: Codable {
    let code: Int?
    let message: String?
}

// MARK: - StayInformed
struct StayInformed: Codable {
    let blog, mastodon: String?
}

// MARK: - Timestamp
struct Timestamp: Codable {
    let createdHTTP: String?
    let createdUnix: Int?

    enum CodingKeys: String, CodingKey {
        case createdHTTP = "created_http"
        case createdUnix = "created_unix"
    }
}

