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
            Text("Pick one to geolocate 📍")
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                .font(.title)
            
            List {
                ForEach(listViewModel.countries) { country in
                    NavigationLink(destination: DetailsView(country: country)) {
                        
                        ListCellView(country: country)
                            .frame(maxWidth: .infinity)
                            
                        
                    }.listRowSeparator(.hidden)
                    
                    
                    
                }
            }
            .scrollContentBackground(.hidden) // Esconder el background
//            .navigationTitle("Pick one to geolocate it") // Título de la lista
//            .navigationBarTitleDisplayMode(.inline) // Meter en el centro el título pequeño
        }
        
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(listViewModel: ListViewModel(repository: RepositoryImpl(remoteDataSource: RemoteDataSourceImpl(), localDataSource: LocalDataSourceImpl())))
    }
}
