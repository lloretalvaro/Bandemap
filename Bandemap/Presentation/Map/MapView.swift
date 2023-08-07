//
//  MapView.swift
//  Bandemap
//
//  Created by Lloret López álvaro on 2/8/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275),
        span: MKCoordinateSpan(latitudeDelta: 40, longitudeDelta: 40))
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: [
            Country(country: "Portugal", capital: "Lisbon", flag: "🇵🇹", coordinates: Coordinates(latitude: 38.7077507, longitude: -9.1365919)),
            Country(country: "Spain", capital: "Madrid", flag: "🇪🇸", coordinates: Coordinates(latitude: 40.4167047, longitude: -3.7035825)),
            Country(country: "Romania", capital: "Bucharest", flag: "🇷🇴", coordinates: Coordinates(latitude: 44.4361414, longitude: 26.1027202)),
            Country(country: "United Kingdom", capital: "London", flag: "🇬🇧", coordinates: Coordinates(latitude: 51.5073359, longitude: -0.12765)),
        ]) {
            location in
            MapAnnotation(
                coordinate: CLLocationCoordinate2D(latitude: location.coordinates.latitude, longitude: location.coordinates.longitude)){
                    Text(location.flag).font(.largeTitle)
            }
        }
            .navigationTitle("Locations")
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
