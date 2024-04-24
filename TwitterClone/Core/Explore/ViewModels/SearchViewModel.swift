//
//  SearchViewModel.swift
//  TwitterClone
//
//  Created by Kakeru Imada on 2024/04/22.
//

import Foundation

class SearchViewModel: ObservableObject{
    @Published var users = [User]()
    @Published var searchText = ""
    
    var searchbleUsers:[User]{
        if searchText.isEmpty{
            return users
        }else{
            let lowercasedQuery = searchText.lowercased()
            return users.filter({
                $0.username.contains(lowercasedQuery) ||
                $0.fullname.lowercased().contains(lowercasedQuery)
            })
        }
    }
    let service = UserService()
    
    init(){
        fetchUsers()
    }
    
    func fetchUsers(){
        service.fetchUsers{users in
            self.users = users
        }
    }
}
