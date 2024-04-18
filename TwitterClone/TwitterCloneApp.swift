//
//  TwitterCloneApp.swift
//  TwitterClone
//
//  Created by Kakeru Imada on 2024/04/08.
//

import SwiftUI
import Firebase


@main
struct TwitterCloneApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
                //LoginView()
            }
            .environmentObject(viewModel)
            //FeedView()
            //MainTabView()
        }
    }
}
