//
//  DetailsCellView.swift
//  Bandemap
//
//  Created by Lloret López álvaro on 7/8/23.
//

import SwiftUI

struct DetailsCellView: View {
    var detailsTitle: String
    var displayedText: String
    var failCondition: Bool
    
    var body: some View {
        HStack{
            Text(detailsTitle)
                .font(.title3)
                .fontWeight(.semibold)
            VStack(alignment: .leading){
                if failCondition {
                    ProgressView()
                        .tint(.red)
                }else{
                    Text(displayedText)
                }
                
            }
        }
        .padding()
        .background(.white)
        .foregroundColor(.black)
        .cornerRadius(16)
    }
}

//struct DetailsCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailsCellView()
//    }
//}
