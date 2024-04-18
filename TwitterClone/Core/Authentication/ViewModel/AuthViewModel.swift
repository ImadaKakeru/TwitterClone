//
//  AuthViewModel.swift
//  TwitterClone
//
//  Created by Kakeru Imada on 2024/04/18.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject{
    @Published var userSession: FirebaseAuth.User?
    
    init(){
        self.userSession = Auth.auth().currentUser
        
        print("DEBUG: user Session is \(self.userSession)")
    }
    
    func login(withEmail email:String, password: String){
        print("DEBUG: Login in with Email \(email)")
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String){
        print("DEBUG: register with Email \(email)")
    }
}
