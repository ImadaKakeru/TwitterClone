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
    
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
                //LoginView()
            }
            //FeedView()
            //MainTabView()
        }
    }
}
