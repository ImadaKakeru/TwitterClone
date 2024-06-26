//
//  ProfileView.swift
//  TwitterClone
//
//  Created by Kakeru Imada on 2024/04/10.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    @State private var selectedFilter: TweetFilterViewModel = .tweets
    @ObservedObject var viewModel: ProfileViewModel
    @Environment(\.presentationMode) var mode
    @Namespace var animation
    //private let user: User
    
    init(user: User){
        //self.user = user
        self.viewModel = ProfileViewModel(user: user)
    }
    var body: some View {
        VStack(alignment: .leading){
            headerView
            actionButtons
            userInfoDetails
            tweetFilterBar
            tweetsView
            
            Spacer()
        }
        //.navigationBarHidden(true)
    }
    
    struct ProfileView_Previews: PreviewProvider {
        static var previews: some View {
            ProfileView(user:User(id: NSUUID().uuidString,
                                  username: "batman",
                                  fullname: "Imada Kakeru",
                                  profileImageUrl: "",
                                  email: "imada@gmail.com"))
        }
    }
}
    /* ProfileViewクラスの拡張を行なっている。ここでは、ProfileViewクラスに
     「headerView」という変数を使えるようにすることで、ProfileViewでそれを呼び出せるようにしている。
     */
extension ProfileView{
    var headerView: some View{
        ZStack(alignment: .bottomLeading){
            Color(.systemBlue)
                .ignoresSafeArea()
            
            VStack{
                // 矢印ボタンを押すと、表示した画面が閉じるように指定
                Button{
                    mode.wrappedValue.dismiss()
                }label:{
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .offset(x:16 ,y: -20)
                }
                KFImage(URL(string: viewModel.user.profileImageUrl))
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 72, height: 72)
                    .offset(x: 16, y:-4)
            }
        }
        .frame(height: 96)
    }
    
    var actionButtons: some View{
        HStack(spacing: 12){
            // HstackでのSpacerなので、右にSpaceを埋める形で下の内容を表示する。
            Spacer()
            
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(Circle().stroke(Color.gray, lineWidth: 0.75))
            Button{
                
            }label:{
                Text(viewModel.actionButtonTitle)
                    .font(.subheadline).bold()
                    .frame(width: 120, height: 32)
                //色の指定。今回はテキストの色指定になる
                    .foregroundColor(.black)
                    // overlayで重ねて表示する。.strokeを入れると、図形が塗りつぶされた状態では無く、図形の輪郭が表示される。
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray,lineWidth:0.75))
            }
        }
        .padding(.trailing)
    }
    
    var userInfoDetails: some View{
        VStack(alignment: .leading,spacing: 4){
            HStack{
                Text(viewModel.user.fullname)
                    .font(.title2).bold()
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
            }
            Text("@\(viewModel.user.username)")
                .font(.subheadline)
                .foregroundColor(.gray)
            Text("Your mother is fucker")
                .font(.subheadline)
                .padding(.vertical)
            
            HStack(spacing: 24){
                HStack{
                    Image(systemName: "mappin.and.ellipse")
                    Text("FFFF,Tokyo")
                }
                HStack{
                    Image(systemName: "link")
                    Text("www.MohoterFucker.com")
                }
            }
            .font(.caption)
            .foregroundColor(.gray)
            
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
        .padding(.horizontal)
    }
    
    var tweetFilterBar: some View{
        HStack{
            /*ForEachは、与えられたコレクション（この場合はTweetFilterViewModel.allCases）の各要素に対してビューを生成するための構造です。*/
            /* TweetFilterViewModel.allcasesは、
             TweetFilterViewModelという列挙型の全ての要素、caseを持つ配列
             今回はVstack形式で、各titleプロパティを出力している。
             */
            ForEach(TweetFilterViewModel.allCases, id: \.rawValue){ item in
                VStack{
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == item ? .semibold : .regular)
                        .foregroundColor(selectedFilter == item ? .black : .gray)
                    
                    // Capsule()は楕円形の図形を表示するもの。ここでは、青色、高さ3の楕円をVstackで表示している。
                    if selectedFilter == item{
                        Capsule()
                            .foregroundColor(Color(.systemBlue))
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    }else{
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height: 3)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut){
                        self.selectedFilter = item
                    }
                }
            }
        }
        // Dividerを追加する。offsetを使うことによってdividerの位置を補正
        .overlay(Divider().offset(x:0 , y:16))
    }
    var tweetsView: some View{
        ScrollView{
            LazyVStack{
                ForEach(viewModel.tweets(forFilter: self.selectedFilter)){ tweet in
                        TweetRowView(tweet: tweet)
                        .padding()
                }
            }
        }
    }
}
