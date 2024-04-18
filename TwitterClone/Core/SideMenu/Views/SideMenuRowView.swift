//
//  SideMenuRowView.swift
//  TwitterClone
//
//  Created by Kakeru Imada on 2024/04/11.
//

import SwiftUI

struct SideMenuRowView: View {
    let viewModel: SideMenuViewModel
    var body: some View {
        HStack(spacing: 16){
            Image(systemName: viewModel.imageName)
                .font(.headline)
                .foregroundColor(.gray)
            Text(viewModel.title)
                .foregroundColor(.black)
                .font(.subheadline)
            // 左に詰める。
            Spacer()
        }
        .frame(height: 40)
        .padding(.horizontal)
    }
}

struct SideMenuRowView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            SideMenuRowView(viewModel: .profile)
            SideMenuRowView(viewModel: .logout)
            SideMenuRowView(viewModel: .bookmarks)
            SideMenuRowView(viewModel: .lists)
        }
    }
}
