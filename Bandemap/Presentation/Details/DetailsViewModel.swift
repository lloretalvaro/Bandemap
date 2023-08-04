//
//  DetailsViewModel.swift
//  Bandemap
//
//  Created by Lloret López álvaro on 4/8/23.
//

import Foundation

final class DetailsViewModel: ObservableObject {
    let country: Country
    private let repository: RepositoryProtocol
    @Published var geocodingInfo: GeocodingInfo?
    
    init(country: Country, repository: RepositoryProtocol) {
        self.country = country
        self.repository = repository
        DispatchQueue.main.async {
            Task {
                guard let geoInfo = try? await repository.getGeocodingInfo(locationDescription:"\(self.country.capital),\(self.country.country)") else {
                    self.geocodingInfo = nil
                    print("Unable to get geocoding information")
                    return
                }
                self.geocodingInfo = geoInfo
            }
        }
    }
}
