//
//  ProfileView.swift
//  TwitterClone
//
//  Created by Kakeru Imada on 2024/04/10.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedFilter: TweetFilterViewModel = .tweets
    @Environment(\.presentationMode) var mode
    @Namespace var animation
    var body: some View {
        VStack(alignment: .leading){
            headerView
            actionButtons
            userInfoDetails
            tweetFilterBar
            tweetsView
            
            Spacer()
        }
    }
    
    struct ProfileView_Previews: PreviewProvider {
        static var previews: some View {
            ProfileView()
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
                        .offset(x:16 ,y: 12)
                }
                Circle()
                    .frame(width: 72, height: 72)
                    .offset(x: 16, y:24)
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
                Text("Edit Profile")
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
                Text("Imada Kakeru")
                    .font(.title2).bold()
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
            }
            Text("@Mother Fucker")
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
                ForEach(0...9 , id: \.self){ _ in
                    TweetRowView()
                        .padding()
                }
            }
        }
    }
}
