//
//  TweetFilterViewModel.swift
//  TwitterClone
//
//  Created by Kakeru Imada on 2024/04/10.
//

/*Foundationフレームワークは、macOS、iOS、watchOS、tvOSなどのAppleのプラットフォームで広く使用されている基本的なフレームワークです。
 Foundationフレームワークには、文字列処理、日付と時刻の操作、ファイル入出力、ネットワーク通信、データのシリアライゼーションなど、
 多くの基本的な機能が含まれています。
 */

import Foundation
//自分で作成した関数。今回は「列挙型」で宣言している。
enum TweetFilterViewModel: Int, CaseIterable{
    case tweets
    case replies
    case likes
    
    var title: String{
        switch self{
        case .tweets: return "Tweets"
        case .replies: return "Replies"
        case .likes: return "Likes"
        }
    }
}
