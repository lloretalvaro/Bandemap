//
//  LoginView.swift
//  Bandemap
//
//  Created by Lloret López álvaro on 1/8/23.
//

import SwiftUI



struct LoginView: View {
    @State private var user = ""
    @State private var password = ""
    @EnvironmentObject var rootViewModel: RootViewModel
    
    var body: some View {
        
        VStack {
            // MARK: - App name and logos
            Text("Bandemap")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.black)
                .padding()
            Image(decorative: "EarthSimple")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 225)
                .accessibilityLabel("An icon of the planet Earth")
            
            // MARK: - User and password textfields
            VStack {
                TextField("", text: $user, prompt: Text("Username").foregroundColor(.gray))
                    .modifier(CustomTextFieldModifier())
                Spacer()
                SecureField("", text: $password,  prompt: Text("Password").foregroundColor(.gray))
                    .modifier(CustomTextFieldModifier())
                    
            }
            .frame(width: 280, height: 115)
            .padding(EdgeInsets(top: 50, leading: 0, bottom: 20, trailing: 0))
            
            // MARK: - Login button
            Button {
                rootViewModel.onLogin(user: user, password: password)
            } label: {
                Text("Login")
                    .modifier(ButtonTextModifier())
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(gradient: Gradient(colors: [.indigo, .green]), startPoint: .bottomLeading, endPoint: .topTrailing)
        )
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
