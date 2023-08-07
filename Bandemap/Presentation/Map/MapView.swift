//
//  MapView.swift
//  Bandemap
//
//  Created by Lloret López álvaro on 2/8/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    @ObservedObject var mapViewModel: MapViewModel
    
    init(mapViewModel: MapViewModel) {
        self.mapViewModel = mapViewModel
    }
    
    // Initial region that the map will be showing at first,
    // after that the user will move the map as he wants.
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 41.3828939, longitude: 2.1774322),
        span: MKCoordinateSpan(latitudeDelta: 30, longitudeDelta: 30))
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: mapViewModel.countries) {
            location in
            MapAnnotation(
                coordinate: CLLocationCoordinate2D(latitude: location.coordinates.latitude, longitude: location.coordinates.longitude)){
                    
                    Text(location.flag).font(.largeTitle).onTapGesture {
                        print("\(location.country) has been tapped")
                    }
                }
        }
        .navigationTitle("Locations")
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(mapViewModel: MapViewModel(repository: RepositoryImpl(remoteDataSource: RemoteDataSourceImpl(), localDataSource: LocalDataSourceImpl())))
    }
}
