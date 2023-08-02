//
//  RootViewModel.swift
//  Bandemap
//
//  Created by Lloret López álvaro on 1/8/23.
//

import Foundation

enum Status {
    case none
    case loading
    case loaded
    case error(error: String)
}


final class RootViewModel: ObservableObject {
    
    // MARK: - Properties
    let repository: RepositoryProtocol
    @Published var status = Status.none
   
    
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
    }
    
    func onLogin(user: String, password: String) {
    // Set status to loading
        self.status = .loading
        
        /* Estoy usando este delay de 0.5s simplemente para
         que el RootView enseñe la pantalla de ProgressView 1s
         y asi simular el tiempo de carga tipico, tras esto
         se ejecuta el login del repository y se cambia el status a
         loaded para mostrar la vista del mapa.
         */
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.repository.login(withUser: user, andPassword: password)
            self.status = .loaded
        }
        
        Task {
            let geocodingInfo = try await repository.getGeocodingInfo()
            let flag = geocodingInfo?.results?[0].annotations?.flag
            print("The flag is: \(flag!)")
        }
        
    }
}
