//
//  AuthenticaionView.swift
//  TwitterClone
//
//  Created by Kakeru Imada on 2024/04/18.
//

import SwiftUI

struct AuthenticaionView: View {
    let title1: String
    let title2: String
    var body: some View {
        VStack(alignment: .leading){
            HStack{Spacer()}
            Text(title1)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text(title2)
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
        .frame(height:260)
        .padding(.leading)
        .foregroundColor(.white)
        .background(Color(.systemBlue))
        .clipShape(RoundedShape(corners: [.bottomRight]))
    }
}

struct AuthenticaionView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticaionView(title1: "Hello", title2:"Welcome Back")
    }
}
