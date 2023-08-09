//
//  DistanceView.swift
//  Bandemap
//
//  Created by Lloret López álvaro on 9/8/23.
//

import SwiftUI

struct DistanceView: View {
    
    @EnvironmentObject var rootViewModel: RootViewModel
    @ObservedObject var distanceViewModel: DistanceViewModel
    @State private var selectedCapital1: String = ""
    @State private var  selectedCapital2: String = ""
    
    init(distanceViewModel: DistanceViewModel) {
        self.distanceViewModel = distanceViewModel
    }
    
    
    var body: some View {
        VStack {
            Text("Calculate the distance between the capitals!")
                .font(.system(.title, design: .rounded))
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
                .padding()
            
            Image(decorative: "DistancePoints")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 225)
                .accessibilityLabel("An icon of the planet Earth")
                
            HStack {
                VStack{
                    Text("Capital 1")
                        .bold()
                    Picker("", selection: $selectedCapital1) {
                        ForEach(distanceViewModel.capitals, id: \.self) {
                            Text($0)
                        }
                    }
                    .frame(width: 150, height: 50)
                    .background(.black)
                    .tint(.white)
                    .cornerRadius(16)
                }
                
                VStack{
                    Text("Capital 2")
                        .bold()
                    Picker("", selection: $selectedCapital2) {
                        ForEach(distanceViewModel.capitals, id: \.self) {
                            Text($0)
                        }
                    }
                    .frame(width: 150, height: 50)
                    .background(.black)
                    .tint(.white)
                    .cornerRadius(16)
                }
                
                
            }
            
            
            if selectedCapital1 != "" &&  selectedCapital2 != ""  && selectedCapital1 != selectedCapital2 {
                Text("The distance between the capitals is \(distanceViewModel.calculateDistance(capital1: selectedCapital1, capital2: selectedCapital2))")
            }
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(gradient: Gradient(colors: [.indigo, .green]), startPoint: .bottomLeading, endPoint: .topTrailing)
        )
        .foregroundColor(.white)
        .toolbarBackground(.visible, for: .tabBar)
    }
}

struct DistanceView_Previews: PreviewProvider {
    static var previews: some View {
        DistanceView(distanceViewModel: DistanceViewModel(repository: RepositoryImpl(remoteDataSource: RemoteDataSourceImpl(), localDataSource: LocalDataSourceImpl())))
    }
}
