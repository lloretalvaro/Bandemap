//
//  LocalDataSourceImpl.swift
//  Bandemap
//
//  Created by Lloret López álvaro on 3/8/23.
//

import Foundation

final class LocalDataSourceImpl: LocalDataSourceProtocol {
    private let countries: [Country] = [
        
        Country(country: "Albania", capital: "Tirana", flag: "🇦🇱"),
        Country(country: "Andorra", capital: "Andorra la Vella", flag: "🇦🇩"),
        Country(country: "Austria", capital: "Vienna", flag: "🇦🇹"),
        Country(country: "Belarus", capital: "Minsk", flag: "🇧🇾"),
        Country(country: "Belgium", capital: "Brussels", flag: "🇧🇪"),
        Country(country: "Bosnia and Herzegovina", capital: "Sarajevo", flag: "🇧🇦"),
        Country(country: "Bulgaria", capital: "Sofia", flag: "🇧🇬"),
        Country(country: "Croatia", capital: "Zagreb", flag: "🇭🇷"),
        Country(country: "Cyprus", capital: "Nicosia", flag: "🇨🇾"),
        Country(country: "Czech Republic", capital: "Prague", flag: "🇨🇿"),
        Country(country: "Denmark", capital: "Copenhagen", flag: "🇩🇰"),
        Country(country: "Estonia", capital: "Tallinn", flag: "🇪🇪"),
        Country(country: "Finland", capital: "Helsinki", flag: "🇫🇮"),
        Country(country: "France", capital: "Paris", flag: "🇫🇷"),
        Country(country: "Germany", capital: "Berlin", flag: "🇩🇪"),
        Country(country: "Greece", capital: "Athens", flag: "🇬🇷"),
        Country(country: "Hungary", capital: "Budapest", flag: "🇭🇺"),
        Country(country: "Iceland", capital: "Reykjavik", flag: "🇮🇸"),
        Country(country: "Ireland", capital: "Dublin", flag: "🇮🇪"),
        Country(country: "Italy", capital: "Rome", flag: "🇮🇹"),
        Country(country: "Latvia", capital: "Riga", flag: "🇱🇻"),
        Country(country: "Liechtenstein", capital: "Vaduz", flag: "🇱🇮"),
        Country(country: "Lithuania", capital: "Vilnius", flag: "🇱🇹"),
        Country(country: "Luxembourg", capital: "Luxembourg City", flag: "🇱🇺"),
        Country(country: "Malta", capital: "Valletta", flag: "🇲🇹"),
        Country(country: "Monaco", capital: "Monaco", flag: "🇲🇨"),
        Country(country: "Montenegro", capital: "Podgorica", flag: "🇲🇪"),
        Country(country: "Netherlands", capital: "Amsterdam", flag: "🇳🇱"),
        Country(country: "Norway", capital: "Oslo", flag: "🇳🇴"),
        Country(country: "Poland", capital: "Warsaw", flag: "🇵🇱"),
        Country(country: "Portugal", capital: "Lisbon", flag: "🇵🇹"),
        Country(country: "Spain", capital: "Madrid", flag: "🇪🇸"),
        Country(country: "Romania", capital: "Bucharest", flag: "🇷🇴"),
        Country(country: "San Marino", capital: "San Marino", flag: "🇸🇲"),
        Country(country: "Serbia", capital: "Belgrade", flag: "🇷🇸"),
        Country(country: "Slovakia", capital: "Bratislava", flag: "🇸🇰"),
        Country(country: "Slovenia", capital: "Ljubljana", flag: "🇸🇮"),
        Country(country: "Sweden", capital: "Stockholm", flag: "🇸🇪"),
        Country(country: "Switzerland", capital: "Bern", flag: "🇨🇭"),
        Country(country: "Moldova", capital: "Chisinau", flag: "🇲🇩"),
        Country(country: "Russia", capital: "Moscow", flag: "🇷🇺"),
        Country(country: "Ukraine", capital: "Kyiv", flag: "🇺🇦"),
        Country(country: "Turkey", capital: "Ankara", flag: "🇹🇷"),
        Country(country: "United Kingdom", capital: "London", flag: "🇬🇧"),
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
        
        //return [Country(country: "Italy", capital: "Rome", flag: "🇮🇹")]
    }
    
    
}
