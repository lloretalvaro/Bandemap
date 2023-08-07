//
//  ListCellView.swift
//  Bandemap
//
//  Created by Lloret López álvaro on 3/8/23.
//

import SwiftUI

struct ListCellView: View {
    var country: Country
    
    init(country: Country) {
        self.country = country
    }
    
    var body: some View {
        VStack(alignment: .center, content: {
            HStack(content: { // Para el row
                // Imagen
                Text(country.flag)
                    .font(.system(size: 100))

                VStack (alignment: .center, content: {
                    Text(country.country)
                        .fontWeight(.semibold)
                        .font(.title)
                    Text(country.capital)
                        .font(.title3)
                })
                
            })
            
            
        })
        .padding(12)
        .frame(width: 300)
        .background(
            LinearGradient(gradient: Gradient(colors: [.yellow, .orange]), startPoint: .bottomLeading, endPoint: .topTrailing)
        )
        .cornerRadius(9)
    }
}

struct ListCellView_Previews: PreviewProvider {
    static var previews: some View {
        ListCellView(country: Country(country: "Spain", capital: "Madrid", flag: "🇪🇸", coordinates: Coordinates(latitude: 40.4167047, longitude: -3.7035825)))
    }
}
