//
//  ButtonTextModifier.swift
//  Bandemap
//
//  Created by Lloret López álvaro on 2/8/23.
//

import SwiftUI

struct ButtonTextModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .padding()
            .frame(width: 140, height: 40)
            .background(.black)
            .cornerRadius(8.0)
            .shadow(radius: 10, x: 13, y: 10)
    }
}
