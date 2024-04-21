//
//  SideMenuView.swift
//  TwitterClone
//
//  Created by Kakeru Imada on 2024/04/11.
//

import SwiftUI
import Kingfisher

struct SideMenuView: View {
    @EnvironmentObject var authviewModel: AuthViewModel
    var body: some View {
        
        if let user = authviewModel.currentUser{
            VStack(alignment: .leading,spacing: 32){
                VStack(alignment: .leading){
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 48, height: 48)
                    
                    VStack(alignment: .leading,spacing: 4){
                        Text(user.fullname)
                            .font(.headline)
                        
                        Text("@\(user.username)")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    UserStatsView()
                }
                .padding(.leading)
                ForEach(SideMenuViewModel.allCases, id: \.rawValue){ viewModel in
                    if viewModel == .profile{
                        NavigationLink{
                            ProfileView(user: user)
                        }label:{
                            SideMenuRowView(viewModel: viewModel)
                        }
                    }else if viewModel == .logout{
                        Button{
                            authviewModel.signOut()
                        }label:{
                            SideMenuRowView(viewModel: viewModel)
                        }
                    }else{
                        SideMenuRowView(viewModel: viewModel)
                    }
                }
    //            .padding(.vertical, 4)
                Spacer()
            }
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}

extension SideMenuView{
    var optionRowView: some View{
        SideMenuView()
    }
}
