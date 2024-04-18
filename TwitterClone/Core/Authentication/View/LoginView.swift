//
//  LoginView.swift
//  TwitterClone
//
//  Created by Kakeru Imada on 2024/04/17.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        VStack{
            AuthenticaionView(title1: "Hello", title2: "Welcome Back")

            VStack(spacing: 40){
                CustominputField(imageName: "envelope", placeholderText: "Email", text: $email)
                CustominputField(imageName: "lock", placeholderText: "Password", text: $password)
                
            }
            .padding(.horizontal,30)
            .padding(.top,24)
            
            HStack{
                Spacer()
                NavigationLink{
                    
                }label:{
                    Text("reset password?")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color(.systemBlue))
                        .padding(.top)
                        .padding(.trailing,24)
                    
                }
            }
            
            Button{
                viewModel.login(withEmail: email, password: password)
            }label: {
                Text("Sign in")
                    .font(.headline)
                    .fontWeight(.bold)
                    .frame(width:300,height:50)
                    .background(Color(.systemBlue))
                    .foregroundColor(.white)
                    .clipShape(Capsule())
            }
            .shadow(color:.gray.opacity(0.5), radius: 10, x:0, y:0)
            Spacer()
            
            NavigationLink{
                RegistrationView()
                    .navigationBarHidden(true)
            }label:{
                HStack{
                    Text("registration is here ")
                        .font(.footnote)
                    Text("Sing up")
                        .font(.footnote)
                }
                .padding(.bottom)
                .foregroundColor(.blue)
            }
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
