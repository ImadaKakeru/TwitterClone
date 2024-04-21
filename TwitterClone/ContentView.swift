//
//  ContentView.swift
//  TwitterClone
//
//  Created by Kakeru Imada on 2024/04/08.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @State private var showMenu = false
    // 環境全て使えるオブジェクト。環境の階層トップでイニシャライズする必要がある。
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group{
            // if use no logged in
            if viewModel.userSession == nil{
                //print("DEBUG: view Login View")
                LoginView()
            }else{
                // have logged in
                mainInterfaceView
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //タイトルを表示するために使うっぽい。
        NavigationView{
            ContentView()
        }
    }
}

extension ContentView{
    
    var mainInterfaceView: some View{
        ZStack(alignment:.topLeading){
            MainTabView()
                .navigationBarHidden(showMenu)
            
            if(showMenu){
                ZStack{
                    Color(.black)
                        .opacity(showMenu ? 0.25 : 0.00)
                }.onTapGesture {
                    withAnimation(.easeInOut){
                        showMenu = false
                    }
                }
                .ignoresSafeArea()
            }
            SideMenuView()
                .frame(width: 300)
                .offset(x: showMenu ? 0 : -300,y:0)
                .background(showMenu ? Color.white : Color.clear)
        }
        .navigationTitle("home")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading){
                if let user = viewModel.currentUser{
                    Button{
                        // togleは論理演算子を反転させるもの。ボタンが押されると、showMenuをtrueにする。
                        withAnimation(.easeInOut){
                            showMenu.toggle()
                        }
                    }label: {
                        KFImage(URL(string: user.profileImageUrl))
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32, height: 32)
                            .clipShape(Circle())
                    }
                }
            }
        }
        .onAppear{
            showMenu = false
        }
    }
}
