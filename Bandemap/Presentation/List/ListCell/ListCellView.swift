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
                        .font(.system(size:30))
                    Text(country.capital)
                        .font(.system(size: 15))
                })
                
            })
            
            
        })
        .padding(9)
        .background(.cyan)
        .cornerRadius(9)
    }
}

struct ListCellView_Previews: PreviewProvider {
    static var previews: some View {
        ListCellView(country: Country(country: "Spain", capital: "Madrid", flag: "🇪🇸"))
    }
}
