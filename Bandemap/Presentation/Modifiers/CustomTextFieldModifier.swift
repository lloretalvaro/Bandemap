//
//  CustomTextModifier.swift
//  Bandemap
//
//  Created by Lloret López álvaro on 2/8/23.
//

import SwiftUI

struct CustomTextFieldModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding(10)
            .background(.white)
            .multilineTextAlignment(.center)
            .foregroundColor(.black)
            .cornerRadius(10)
    }
}
