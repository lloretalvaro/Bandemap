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
                
                if detailsViewModel.geocodingInfo?.results?[0].formatted == nil  {
                    ProgressView()
                        .tint(.red)
                }else {
                    Text(detailsViewModel.geocodingInfo?.results?[0].formatted ?? "Error requesting formatted location")
                        .font(.title)
                        .multilineTextAlignment(.center)
                    Text(detailsViewModel.geocodingInfo?.results?[0].components?.continent ?? "Error requesting continent")
                        .font(.title3)
                }
                
                
                
            }
            .padding(40)
            .background(.black)
            .foregroundColor(.white)
            .cornerRadius(16)
            
            DetailsCellView(detailsTitle: "📍 Located in", displayedText: "(\(detailsViewModel.geocodingInfo?.results?[0].geometry?.lat ?? 0.0), \(detailsViewModel.geocodingInfo?.results?[0].geometry?.lng ?? 0.0))",
                            failCondition: detailsViewModel.geocodingInfo?.results?[0].geometry?.lat == nil || detailsViewModel.geocodingInfo?.results?[0].geometry?.lng == nil)
            
            DetailsCellView(detailsTitle: "💰 Currency the", displayedText: "\(detailsViewModel.geocodingInfo?.results?[0].annotations?.currency?.name ?? "Error requesting currency name") with symbol \(detailsViewModel.geocodingInfo?.results?[0].annotations?.currency?.symbol ?? "Error requesting currency symbol")",
                            failCondition: detailsViewModel.geocodingInfo?.results?[0].geometry?.lat == nil || detailsViewModel.geocodingInfo?.results?[0].geometry?.lng == nil)
            
            DetailsCellView(detailsTitle: "🚅 They measure speed with", displayedText: "\(detailsViewModel.geocodingInfo?.results?[0].annotations?.roadinfo?.speedIn ?? "Error requesting units")",
                            failCondition: detailsViewModel.geocodingInfo?.results?[0].annotations?.roadinfo?.speedIn == nil)
            
            DetailsCellView(detailsTitle: "🚘 They drive on the", displayedText: "\(detailsViewModel.geocodingInfo?.results?[0].annotations?.roadinfo?.driveOn ?? "Error requesting where they drive")",
                            failCondition: detailsViewModel.geocodingInfo?.results?[0].annotations?.roadinfo?.driveOn == nil)
            
            DetailsCellView(detailsTitle: "📞 The calling code is", displayedText: "\(detailsViewModel.geocodingInfo?.results?[0].annotations?.callingcode ?? 0)",
                            failCondition: detailsViewModel.geocodingInfo?.results?[0].annotations?.callingcode == nil)
            
            
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
