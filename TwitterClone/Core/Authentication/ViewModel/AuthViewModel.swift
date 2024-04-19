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
        Auth.auth().signIn(withEmail: email, password: password){result, error in
            if let error = error{
                print("DEBUG: Failed to sign in with error \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else{ return }
            self.userSession = user
            
            print("DEBUG: sign in...")
        }
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String){
        Auth.auth().createUser(withEmail: email, password: password){result, error in
            if let error = error{
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else{ return }
            self.userSession = user
            
            print("DEBUG user access is succeeeded")
            print("DEBUG: userSession = \(self.userSession)")
            
            let data = ["email" : email,
                        "username" : username.lowercased(),
                        "fullname" : fullname,
                        "uid" : user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data){ _ in
                    print("DEBUG: Did upload user info...")
                }
        }
    }
    
    func signOut(){
        
        // to reset window for logout
        userSession = nil
        
        // logout on fire server
        try? Auth.auth().signOut()
    }
}
