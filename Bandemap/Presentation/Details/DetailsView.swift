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
            VStack{
                Text("\(country.flag)")
                    .font(.system(size: 100))
                Text(detailsViewModel.geocodingInfo?.results?[0].formatted ?? "Error while requesting geocoding info")
                    .font(.title)
            }
            .padding(50)
            .background(.black)
            .foregroundColor(.white)
            .cornerRadius(16)
            
            
            
            HStack{
                Text("📍 Located in →")
                    .font(.title3)
                    .fontWeight(.semibold)
                VStack(alignment: .leading){
                    Text("Latitude: \(detailsViewModel.geocodingInfo?.results?[0].geometry?.lat ?? 0.0) ")
                    Text("Longitude: \(detailsViewModel.geocodingInfo?.results?[0].geometry?.lng ?? 0.0)")
                }
            }
            .padding()
            .background(.white)
            .foregroundColor(.black)
            .cornerRadius(16)
            
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(gradient: Gradient(colors: [.indigo, .green]), startPoint: .bottomLeading, endPoint: .topTrailing)
        )
        .toolbarBackground(.visible, for: .tabBar)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(country: Country(country: "Spain", capital: "Madrid", flag: "🇪🇸", coordinates: Coordinates(latitude: 40.4167047, longitude: -3.7035825)), detailsViewModel: DetailsViewModel(country:Country(country: "Spain", capital: "Madrid", flag: "🇪🇸", coordinates: Coordinates(latitude: 40.4167047, longitude: -3.7035825)), repository: RepositoryImpl(remoteDataSource: RemoteDataSourceImpl(), localDataSource: LocalDataSourceImpl())))
    }
}
