//
//  FeedViewModel.swift
//  TwitterClone
//
//  Created by Kakeru Imada on 2024/04/24.
//

import Foundation


class FeedViewModel: ObservableObject{
    @Published var tweets = [Tweet]()
    let service = TweetService()
    
    init(){
        fetchTweets()
    }
    
    func fetchTweets(){
        service.fetchTweets{tweets in
            self.tweets = tweets
        }
    }
}
