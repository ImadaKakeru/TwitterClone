//
//  SideMenuView.swift
//  TwitterClone
//
//  Created by Kakeru Imada on 2024/04/11.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        VStack(alignment: .leading,spacing: 32){
            VStack(alignment: .leading){
                Circle()
                    .frame(width: 48, height: 48)
                
                VStack(alignment: .leading,spacing: 4){
                    Text("Imada Kakeru")
                        .font(.headline)
                    
                    Text("@packman")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                UserStatsView()
            }
            .padding(.leading)
            ForEach(SideMenuViewModel.allCases, id: \.rawValue){ option in
                HStack(spacing: 16){
                    Image(systemName: option.imageName)
                        .font(.headline)
                        .foregroundColor(.gray)
                    Text(option.title)
                        .font(.subheadline)
                    
                    // 左に詰める。
                    Spacer()
                }
                .frame(height: 40)
                .padding(.horizontal)
            }
//            .padding(.vertical, 4)
            Spacer()
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
