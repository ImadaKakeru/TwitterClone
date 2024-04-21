//
//  PhotoSelecterView.swift
//  TwitterClone
//
//  Created by Kakeru Imada on 2024/04/20.
//

import SwiftUI

struct ProfilePhotoSelecterView: View {
    var body: some View {
        VStack{
            AuthenticaionView(title1:"Create your accout" , title2: "Select a photo")
            
            Button{
                print("add profile photo")
            }label: {
                Image(systemName:"person")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color(.systemPink))
                    .scaledToFit()
                    .frame(width: 180,height: 180)
                    .padding(.top,44)
            }
            Spacer()
        }
        .ignoresSafeArea()
    }
}

struct ProfilePhotoSelecterView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelecterView()
    }
}
