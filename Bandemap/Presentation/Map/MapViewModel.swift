//
//  MapViewModel.swift
//  Bandemap
//
//  Created by Lloret López álvaro on 7/8/23.
//

import Foundation

final class MapViewModel {
    private let repository: RepositoryProtocol
    @Published var countries: [Country] = []
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
        DispatchQueue.main.async {
            Task {
                guard let countriesList = try? await repository.getCountries() else {
                    self.countries = []
                    print("Unable to get countries")
                    return
                }
                self.countries = countriesList
            }
        }
    }
}
