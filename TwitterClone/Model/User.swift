//
//  User.swift
//  TwitterClone
//
//  Created by Kakeru Imada on 2024/04/21.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable{
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
}
