//
//  NewTweetView.swift
//  TwitterClone
//
//  Created by Kakeru Imada on 2024/04/12.
//

import SwiftUI
import Kingfisher

struct NewTweetView: View {
    @State private var caption = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var viewModel = UploadTweetViewModel()
    
    var body: some View {
        VStack{
            HStack{
                Button{
                 presentationMode.wrappedValue.dismiss()
                }label: {
                    Text("Cancel")
                        .foregroundColor(Color(.systemBlue))
                }
                Spacer()
                
                Button{
                    viewModel.uploadTweet(withCaption: caption)
                }label: {
                    Text("Tweet")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
            }
            .padding()
            
            HStack(alignment: .top){
                if let user = authViewModel.currentUser{
                    KFImage(URL(string:user.profileImageUrl))
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 64, height: 64)
                }
                TextArea("Fuck you !!", text: $caption)
            }
            .padding()
        }
        .onReceive(viewModel.$didUploadTweet){ success in
            if success{
                presentationMode.wrappedValue.dismiss()
            }
            
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
    }
}
