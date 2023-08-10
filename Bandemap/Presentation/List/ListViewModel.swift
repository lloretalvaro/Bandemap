//
//  ListViewModel.swift
//  Bandemap
//
//  Created by Lloret López álvaro on 3/8/23.
//

import Foundation

final class ListViewModel: ObservableObject {
    private let repository: RepositoryProtocol
    @Published var countries: [Country] = []
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
        initCountries()
    }
    
    func initCountries(closure: @escaping ()->() = {}){
        DispatchQueue.main.async {
            Task {
                guard let countriesList = try? await self.repository.getCountries() else {
                    self.countries = []
                    print("Unable to get countries")
                    closure()
                    return
                }
                self.countries = countriesList
                closure()
            }
        }
    }
    
}
