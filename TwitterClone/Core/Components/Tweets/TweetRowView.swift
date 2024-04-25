//
//  TweetRowView.swift
//  TwitterClone
//
//  Created by Kakeru Imada on 2024/04/08.
//

import SwiftUI
import Kingfisher

struct TweetRowView: View {
    let tweet: Tweet
    var body: some View {
        VStack(alignment: .leading){
            // profile image + user info + tweet
            if let user = tweet.user{
                HStack(alignment: .top, spacing: 12){
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 56, height: 56)
                        .clipShape(Circle())
                    //user info & tweet caption
                    VStack(alignment: .leading, spacing: 4){
                        // user info
                            HStack{
                                Text(user.fullname)
                                    .font(.subheadline).bold()
                                Text("@\(user.username)")
                                    .foregroundColor(.gray)
                                    .font(.caption)
                                Text("4545m")
                                    .foregroundColor(.gray)
                                    .font(.caption)
                            }
                        }
                        // tweet caption
                        Text(tweet.caption)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                    }
            }
            // action buttons
            HStack{
                Button{
                    // action goes here
                } label:{
                    Image(systemName: "bubble.left")
                        .font(.subheadline)

                }
                Spacer()
                Button{
                    // action goes here
                } label:{
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)

                }
                Spacer()
                Button{
                    // action goes here
                } label:{
                    Image(systemName: "heart")
                        .font(.subheadline)

                }
                Spacer()
                Button{
                    // action goes here
                } label:{
                    Image(systemName: "bookmark")
                        .font(.subheadline)

                }
            }
            //上下左右に余白をつける。引数にtop,bottom,leading,traillingで上下左右に余白をつけれる。
            .padding()
            .foregroundColor(.gray)
            Divider()
        }
//        .padding()
    }
}

//struct TweetRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetRowView()
//    }
//}
