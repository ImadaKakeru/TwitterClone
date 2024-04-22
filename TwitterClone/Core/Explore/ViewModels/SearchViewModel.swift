//
//  SearchViewModel.swift
//  TwitterClone
//
//  Created by Kakeru Imada on 2024/04/22.
//

import Foundation

class SearchViewModel: ObservableObject{
    @Published var users = [User]()
    let service = UserService()
    
    init(){
        fetchUsers()
    }
    
    func fetchUsers(){
        service.fetchUsers{users in
            self.users = users
            
            print("DEBUG: Users \(users)")
        }
    }
}
