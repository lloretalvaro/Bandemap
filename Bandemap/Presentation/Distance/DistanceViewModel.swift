//
//  DistanceViewModel.swift
//  Bandemap
//
//  Created by Lloret López álvaro on 9/8/23.
//

import Foundation
import CoreLocation

final class DistanceViewModel: ObservableObject {
    private let repository: RepositoryProtocol
    @Published var countries: [Country] = []
    @Published var capitals: [String] = []
    
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
                
                self.capitals = self.countries.map({ country in
                    return country.capital
                })
                
            }
        }
    }
    
    func calculateDistance(capital1: String, capital2: String) -> Int {
        let country1 = self.countries.filter{$0.capital == capital1}[0]
        let country2 = self.countries.filter{$0.capital == capital2}[0]
        
        let coordinatesA = (latitude: country1.coordinates.latitude, longitude: country1.coordinates.longitude)
        let coordinatesB = (latitude: country2.coordinates.latitude, longitude: country2.coordinates.longitude)
        
        
        let locationA = CLLocation(latitude: coordinatesA.latitude, longitude: coordinatesA.longitude)
        let locationB = CLLocation(latitude: coordinatesB.latitude, longitude: coordinatesB.longitude)
            
        let distance = locationA.distance(from: locationB) / 1000
        return Int(distance)
    }
}
