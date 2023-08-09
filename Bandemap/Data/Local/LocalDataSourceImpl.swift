//
//  LocalDataSourceImpl.swift
//  Bandemap
//
//  Created by Lloret López álvaro on 3/8/23.
//

import Foundation

final class LocalDataSourceImpl: LocalDataSourceProtocol {
    private let countries: [Country] = [
        Country(country: "Albania", capital: "Tirana", flag: "🇦🇱", coordinates: Coordinates(latitude: 41.3281482, longitude: 19.8184435)),
        Country(country: "Andorra", capital: "Andorra la Vella", flag: "🇦🇩", coordinates: Coordinates(latitude: 42.5069391, longitude: 1.5212467)),
        Country(country: "Austria", capital: "Vienna", flag: "🇦🇹", coordinates: Coordinates(latitude: 48.2083537, longitude: 16.3725042)),
        Country(country: "Belarus", capital: "Minsk", flag: "🇧🇾", coordinates: Coordinates(latitude: 53.9024716, longitude: 27.5618225)),
        Country(country: "Belgium", capital: "Brussels", flag: "🇧🇪", coordinates: Coordinates(latitude: 50.8465573, longitude: 4.351697)),
        Country(country: "Bosnia and Herzegovina", capital: "Sarajevo", flag: "🇧🇦", coordinates: Coordinates(latitude: 43.8519774, longitude: 18.3866868)),
        Country(country: "Bulgaria", capital: "Sofia", flag: "🇧🇬", coordinates: Coordinates(latitude: 42.6977028, longitude: 23.3217359)),
        Country(country: "Croatia", capital: "Zagreb", flag: "🇭🇷", coordinates: Coordinates(latitude: 45.8426414, longitude: 15.9622315)),
        Country(country: "Cyprus", capital: "Nicosia", flag: "🇨🇾", coordinates: Coordinates(latitude: 35.1748976, longitude: 33.3638568)),
        Country(country: "Czech Republic", capital: "Prague", flag: "🇨🇿", coordinates: Coordinates(latitude: 50.0874654, longitude: 14.4212535)),
        Country(country: "Denmark", capital: "Copenhagen", flag: "🇩🇰", coordinates: Coordinates(latitude: 55.6867243, longitude: 12.5700724)),
        Country(country: "Estonia", capital: "Tallinn", flag: "🇪🇪", coordinates: Coordinates(latitude: 59.4372155, longitude: 24.7453688)),
        Country(country: "Finland", capital: "Helsinki", flag: "🇫🇮", coordinates: Coordinates(latitude: 60.1674881, longitude: 24.9427473)),
        Country(country: "France", capital: "Paris", flag: "🇫🇷", coordinates: Coordinates(latitude: 48.8588897, longitude: 2.320041)),
        Country(country: "Germany", capital: "Berlin", flag: "🇩🇪", coordinates: Coordinates(latitude: 52.5170365, longitude: 13.3888599)),
        Country(country: "Greece", capital: "Athens", flag: "🇬🇷", coordinates: Coordinates(latitude: 37.9755648, longitude: 23.7348324)),
        Country(country: "Hungary", capital: "Budapest", flag: "🇭🇺", coordinates: Coordinates(latitude: 47.4978918, longitude: 19.0401609)),
        Country(country: "Iceland", capital: "Reykjavik", flag: "🇮🇸", coordinates: Coordinates(latitude: 64.145981, longitude: -21.9422367)),
        Country(country: "Ireland", capital: "Dublin", flag: "🇮🇪", coordinates: Coordinates(latitude: 53.3493795, longitude: -6.2605593)),
        Country(country: "Italy", capital: "Rome", flag: "🇮🇹", coordinates: Coordinates(latitude: 41.8933203, longitude: 12.4829321)),
        Country(country: "Latvia", capital: "Riga", flag: "🇱🇻", coordinates: Coordinates(latitude: 56.9493977, longitude: 24.1051846)),
        Country(country: "Liechtenstein", capital: "Vaduz", flag: "🇱🇮", coordinates: Coordinates(latitude: 47.1392862, longitude: 9.5227962)),
        Country(country: "Lithuania", capital: "Vilnius", flag: "🇱🇹", coordinates: Coordinates(latitude: 54.6870458, longitude: 25.2829111)),
        Country(country: "Luxembourg", capital: "Luxembourg City", flag: "🇱🇺", coordinates: Coordinates(latitude: 49.6112768, longitude: 6.129799)),
        Country(country: "Malta", capital: "Valletta", flag: "🇲🇹", coordinates: Coordinates(latitude: 35.8989818, longitude: 14.5136759)),
        Country(country: "Monaco", capital: "Monaco", flag: "🇲🇨", coordinates: Coordinates(latitude: 43.7323492, longitude: 7.4276832)),
        Country(country: "Montenegro", capital: "Podgorica", flag: "🇲🇪", coordinates: Coordinates(latitude: 42.4415238, longitude: 19.2621081)),
        Country(country: "Netherlands", capital: "Amsterdam", flag: "🇳🇱", coordinates: Coordinates(latitude: 52.3730796, longitude: 4.8924534)),
        Country(country: "Norway", capital: "Oslo", flag: "🇳🇴", coordinates: Coordinates(latitude: 59.9133301, longitude: 10.7389701)),
        Country(country: "Poland", capital: "Warsaw", flag: "🇵🇱", coordinates: Coordinates(latitude: 52.2337172, longitude: 21.0714322)),
        Country(country: "Portugal", capital: "Lisbon", flag: "🇵🇹", coordinates: Coordinates(latitude: 38.7077507, longitude: -9.1365919)),
        Country(country: "Spain", capital: "Madrid", flag: "🇪🇸", coordinates: Coordinates(latitude: 40.4167047, longitude: -3.7035825)),
        Country(country: "Romania", capital: "Bucharest", flag: "🇷🇴", coordinates: Coordinates(latitude: 44.4361414, longitude: 26.1027202)),
        Country(country: "San Marino", capital: "San Marino", flag: "🇸🇲", coordinates: Coordinates(latitude: 43.9458623, longitude: 12.458306)),
        Country(country: "Serbia", capital: "Belgrade", flag: "🇷🇸", coordinates: Coordinates(latitude: 44.8178131, longitude: 20.4568974)),
        Country(country: "Slovakia", capital: "Bratislava", flag: "🇸🇰", coordinates: Coordinates(latitude: 48.1516988, longitude: 17.1093063)),
        Country(country: "Slovenia", capital: "Ljubljana", flag: "🇸🇮", coordinates: Coordinates(latitude: 46.0500268, longitude: 14.5069289)),
        Country(country: "Sweden", capital: "Stockholm", flag: "🇸🇪", coordinates: Coordinates(latitude: 59.3251172, longitude: 18.0710935)),
        Country(country: "Switzerland", capital: "Bern", flag: "🇨🇭", coordinates: Coordinates(latitude: 46.9482713, longitude: 7.4514512)),
        Country(country: "Moldova", capital: "Chisinau", flag: "🇲🇩", coordinates: Coordinates(latitude: 47.0245117, longitude: 28.8322923)),
        Country(country: "Russia", capital: "Moscow", flag: "🇷🇺", coordinates: Coordinates(latitude: 55.7504461, longitude: 37.6174943)),
        Country(country: "Ukraine", capital: "Kyiv", flag: "🇺🇦", coordinates: Coordinates(latitude: 50.4500336, longitude: 30.5241361)),
        Country(country: "Turkey", capital: "Ankara", flag: "🇹🇷", coordinates: Coordinates(latitude: 39.9207759, longitude: 32.8540497)),
        Country(country: "United Kingdom", capital: "London", flag: "🇬🇧", coordinates: Coordinates(latitude: 51.5073359, longitude: -0.12765)),
    ]
    
    private let countries2: [Country] = [
        Country(country: "Portugal", capital: "Lisbon", flag: "🇵🇹", coordinates: Coordinates(latitude: 38.7077507, longitude: -9.1365919)),
        Country(country: "Spain", capital: "Madrid", flag: "🇪🇸", coordinates: Coordinates(latitude: 40.4167047, longitude: -3.7035825)),
        Country(country: "Romania", capital: "Bucharest", flag: "🇷🇴", coordinates: Coordinates(latitude: 44.4361414, longitude: 26.1027202)),
        Country(country: "United Kingdom", capital: "London", flag: "🇬🇧", coordinates: Coordinates(latitude: 51.5073359, longitude: -0.12765)),
    ]
    
    func getCountries() async throws -> [Country]? {
        
        
//        let decoder = JSONDecoder()
//        guard
//             let url = Bundle.main.url(forResource: "/Users/n162173/Downloads/europeanCountries.json", withExtension: "json"),
//             let data = try? Data(contentsOf: url),
//             let countries = try? decoder.decode([Country].self, from: data)
//        else {
//             return nil
//        }

        return countries
    }
    
    
}
