//
//  ExploreView.swift
//  TwitterClone
//
//  Created by Kakeru Imada on 2024/04/10.
//

import SwiftUI

struct ExploreView: View {
    @ObservedObject var viewModel  = SearchViewModel()
    var body: some View {

        VStack{
            ScrollView{
                LazyVStack{
                    ForEach(viewModel.users){ user in
                        // UserRowViewにProfileViewに飛ぶリンクを作成する。
                        NavigationLink{
                               ProfileView(user: user)
                        }label: {
                            UserRowView(user: user)
                        }
                    }
                }
            }
        }
        .navigationTitle("Explore")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
