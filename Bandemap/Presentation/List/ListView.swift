//
//  ListView.swift
//  Bandemap
//
//  Created by Lloret López álvaro on 3/8/23.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var rootViewModel: RootViewModel
    @ObservedObject var listViewModel: ListViewModel
    
    init(listViewModel: ListViewModel) {
        self.listViewModel = listViewModel
    }
    
    var body: some View {
        
        NavigationStack {
           
            
            List {
                ForEach(listViewModel.countries) { country in
                    NavigationLink(destination: DetailsView(country: country, detailsViewModel: DetailsViewModel(country: country, repository: rootViewModel.repository))) {
                        
                        ListCellView(country: country)
                            .frame(maxWidth: .infinity)
                        
                        
                    }
                    .listRowSeparator(.hidden)
                    
                    
                }
            }
            .scrollContentBackground(.hidden) // Esconder el background
            .background(
                LinearGradient(gradient: Gradient(colors: [.indigo, .green]), startPoint: .bottomLeading, endPoint: .topTrailing)
            )
            .navigationTitle("Pick 1 to geolocate 📍") // Título de la lista
            //            .navigationBarTitleDisplayMode(.inline) // Meter en el centro el título pequeño
        }
        .toolbarBackground(.visible, for: .tabBar)
        
        
    }
}

//struct ListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListView(listViewModel: ListViewModel(repository: RepositoryImpl(remoteDataSource: RemoteDataSourceImpl(), localDataSource: LocalDataSourceImpl())))
//    }
//}
