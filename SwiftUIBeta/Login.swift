//
//  Login.swift
//  SwiftUIBeta
//
//  Created by Valentina Vera Paz on 1/06/24.
//

import SwiftUI

struct Login: View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack(content: {
            TextField("Username", text: self.$username)
                .keyboardType(.numberPad)
                .autocorrectionDisabled()
                .padding(8)
                .font(.headline)
                .background(Color.gray.opacity(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 6))
                .onChange(of: username){
                    print("value \(username)")
                }
            SecureField("Password", text: self.$password)
                .keyboardType(.default)
                .autocorrectionDisabled()
                .padding(8)
                .font(.headline)
                .background(Color.gray.opacity(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 6))
                .onChange(of: password){
                    print("value \(password)")
                }
        }).padding()
    }
}

#Preview {
    Login()
}
