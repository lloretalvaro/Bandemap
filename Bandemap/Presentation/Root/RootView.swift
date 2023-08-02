//
//  RootView.swift
//  Bandemap
//
//  Created by Lloret López álvaro on 1/8/23.
//

import SwiftUI

struct RootView: View {
    
    @EnvironmentObject var rootViewModel: RootViewModel
    
    var body: some View {
      
        switch (rootViewModel.status) {
            
        case Status.none:
            LoginView()
        
        case Status.loading:
            ProgressView()
        
        case Status.error(error: let errorString):
            Text("Error \(errorString)")
            
        case Status.loaded:
            MapView()
        }
        
    }
}

//struct RootView_Previews: PreviewProvider {
//    static var previews: some View {
//        RootView()
//    }
//}
