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
    var body: some View {
        VStack{
            AuthenticaionView(title1:"Get started" , title2:"Create your account" )
            
            VStack(spacing: 40){
                CustominputField(imageName: "envelope", placeholderText: "Email", text: $email)
                
                CustominputField(imageName: "person", placeholderText: "Username", text: $username)
                
                CustominputField(imageName: "person", placeholderText: "fullname", text: $fullname)
                
                CustominputField(imageName: "lock", placeholderText: "Password", text: $password)
            }
            .padding(32)
            
            Button{
                print("Sign up here...")
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