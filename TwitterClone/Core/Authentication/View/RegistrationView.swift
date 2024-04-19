//
//  RegistrationView.swift
//  TwitterClone
//
//  Created by Kakeru Imada on 2024/04/17.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        VStack{
            AuthenticaionView(title1:"Get started" , title2:"Create your account" )
            
            VStack(spacing: 40){
                CustominputField(imageName: "envelope",
                                 placeholderText: "Email",
                                 isSecureField: false,
                                 text: $email)
                
                CustominputField(imageName: "person",
                                 placeholderText: "Username",
                                 isSecureField: false,
                                 text: $username)
                
                CustominputField(imageName: "person",
                                 placeholderText: "fullname",
                                 isSecureField: false,
                                 text: $fullname)
                
                CustominputField(imageName: "lock",
                                 placeholderText: "Password",
                                 isSecureField: true,
                                 text: $password)
            }
            .padding(32)
            
            Button{
                viewModel.register(withEmail: email, password: password, fullname:fullname, username: username)
            }label: {
                Text("Sign up")
                    .font(.headline)
                    .fontWeight(.bold)
                    .frame(width:300,height:50)
                    .background(Color(.systemBlue))
                    .foregroundColor(.white)
                    .clipShape(Capsule())
            }
            .shadow(color:.gray.opacity(0.5), radius: 10, x:0, y:0)
            
            Spacer()
            
            Button{
                presentationMode.wrappedValue.dismiss()
            }label:{
                HStack{
                    Text("Already having account ? ")
                        .font(.footnote)
                    Text("Sing In")
                        .font(.footnote)
                }
                .padding(.bottom)
                .foregroundColor(.blue)
            }
            
        }
        .ignoresSafeArea()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
