//
//  TweetRowViewModel.swift
//  TwitterClone
//
//  Created by Kakeru Imada on 2024/05/05.
//

import Foundation

class TweetRowViewModel: ObservableObject{
    @Published var  tweet: Tweet
    private let service = TweetService()
    
    init(tweet: Tweet){
        self.tweet = tweet
        checkIfUserLikedTweet()
    }
    func likeTweet(){
        service.likeTweet(tweet){
            self.tweet.didLike = true
        }
    }
    
    func unLikeTweet(){
        service.unlikeTweet(tweet){
            self.tweet.didLike = false
        }
    }
    func checkIfUserLikedTweet(){
        service.checkIfUserLikedTweet(tweet){ didLike  in
            if didLike{
                self.tweet.didLike = true
            }
        }
    }
}
