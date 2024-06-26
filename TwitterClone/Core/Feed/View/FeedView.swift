//
//  FeedView.swift
//  TwitterClone
//
//  Created by Kakeru Imada on 2024/04/08.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewTweetView = false
    @ObservedObject var viewModel = FeedViewModel()
    var body: some View {
        ZStack(alignment:.bottomTrailing){
            ScrollView{
                LazyVStack{
                    ForEach(viewModel.tweets){ tweet in
                        TweetRowView(tweet: tweet)
                            .padding()
                    }
                }
            }
            Button{
                showNewTweetView.toggle()
            }label: {
                Image("tweet")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 28, height: 28)
                    .padding()
            }
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            
            //showNewTweetViewが存在していたら、画面をNewTweetViewで埋める。
            .fullScreenCover(isPresented: $showNewTweetView){
                NewTweetView()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
