//
//  TextArea.swift
//  TwitterClone
//
//  Created by Kakeru Imada on 2024/04/12.
//

import SwiftUI

struct TextArea: View {
    // var 変数名：型
    @Binding var text: String
    let placeholder: String
    
    init(_ placeholder: String,text: Binding<String>) {
        //Bindingの時は「_」をつける。
        self._text = text
        self.placeholder = placeholder
        UITextView.appearance().backgroundColor = .clear
    }
    var body: some View {
        ZStack(alignment: .topLeading){
            if text.isEmpty{
                Text(placeholder)
                    .foregroundColor(Color(.placeholderText))
                    .padding(.horizontal,8)
                    .padding(.vertical,12)
            }
            TextEditor(text: $text)
                .padding(4)
        }
        .font(.body)
    }
}
