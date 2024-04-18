//
//  ContentView.swift
//  TwitterClone
//
//  Created by Kakeru Imada on 2024/04/08.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    var body: some View {
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
                Button{
                    // togleは論理演算子を反転させるもの。ボタンが押されると、showMenuをtrueにする。
                    withAnimation(.easeInOut){
                        showMenu.toggle()
                    }
                }label: {
                    Circle()
                        .frame(width: 32, height: 32)
                }
            }
        }
        .onAppear{
            showMenu = false
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
