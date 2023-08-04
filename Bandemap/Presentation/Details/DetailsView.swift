//
//  DetailsView.swift
//  Bandemap
//
//  Created by Lloret López álvaro on 4/8/23.
//

import SwiftUI

struct DetailsView: View {
    
    var country: Country
    
    init(country: Country) {
        self.country = country
    }
    
    var body: some View {
        Text("Country: \(country.country) \(country.capital) \(country.flag) ")
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(country: Country(country: "Spain", capital: "Madrid", flag: "🇪🇸"))
    }
}
