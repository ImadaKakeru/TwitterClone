//
//  UserStatsView.swift
//  TwitterClone
//
//  Created by Kakeru Imada on 2024/04/11.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
        HStack(spacing:24){
            HStack{
                Text("9999")
                    .bold()
                    .font(.subheadline)
                Text("Following")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            HStack{
                Text("9999")
                    .bold()
                    .font(.subheadline)
                Text("Followed")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical)
    }
}

struct UserStatsView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatsView()
    }
}
