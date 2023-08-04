//
//  DetailsView.swift
//  Bandemap
//
//  Created by Lloret López álvaro on 4/8/23.
//

import SwiftUI

struct DetailsView: View {
    
    let country: Country
    @ObservedObject var detailsViewModel: DetailsViewModel
    
    
    init(country: Country, detailsViewModel: DetailsViewModel) {
        self.country = country
        self.detailsViewModel = detailsViewModel
    }
    
    var body: some View {
        VStack{
            Text("Country: \(country.country) \(country.capital) \(country.flag) ")
            Text(detailsViewModel.geocodingInfo?.results?[0].formatted ?? "Error while requesting geocoding info")
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(country: Country(country: "Spain", capital: "Madrid", flag: "🇪🇸"), detailsViewModel: DetailsViewModel(country:Country(country: "Spain", capital: "Madrid", flag: "🇪🇸"), repository: RepositoryImpl(remoteDataSource: RemoteDataSourceImpl(), localDataSource: LocalDataSourceImpl())))
    }
}
