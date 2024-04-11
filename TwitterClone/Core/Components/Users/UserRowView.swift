//
//  UserRowView.swift
//  TwitterClone
//
//  Created by Kakeru Imada on 2024/04/11.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack(spacing: 12){
            Circle()
                .frame(width: 48, height: 48)
            VStack{
                Text("Imada Kakeru")
                    .font(.subheadline).bold()
                    .foregroundColor(.black)
                
                Text("Mothoe Fucker")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical)
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView()
    }
}
