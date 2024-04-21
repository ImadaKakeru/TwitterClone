//
//  ExploreView.swift
//  TwitterClone
//
//  Created by Kakeru Imada on 2024/04/10.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {

        VStack{
            ScrollView{
                LazyVStack{
                    ForEach(0 ... 25, id: \.self){ _ in
                        // UserRowViewにProfileViewに飛ぶリンクを作成する。
                        NavigationLink{
//                               ProfileView()
                        }label: {
                            UserRowView()
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
