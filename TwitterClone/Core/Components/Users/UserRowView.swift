//
//  UserRowView.swift
//  TwitterClone
//
//  Created by Kakeru Imada on 2024/04/11.
//

import SwiftUI
import Kingfisher

struct UserRowView: View {
    let user: User
    var body: some View {
        HStack(spacing: 12){
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: 48, height: 48)
            VStack{
                Text(user.username)
                    .font(.subheadline).bold()
                    .foregroundColor(.black)
                
                Text(user.fullname)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical)
    }
}

//struct UserRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        //UserRowView(user: User)
//    }
//}
