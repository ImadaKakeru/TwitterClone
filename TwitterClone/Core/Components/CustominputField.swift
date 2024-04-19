//
//  CustominputField.swift
//  TwitterClone
//
//  Created by Kakeru Imada on 2024/04/17.
//

import SwiftUI

struct CustominputField: View {
    //CustominputField関数の引数？
    let imageName: String
    let placeholderText: String
    let isSecureField: Bool?
    @Binding var text: String
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width:20 , height:30)
                    .foregroundColor(Color(.darkGray))
                
                if isSecureField ?? false{
                    SecureField(placeholderText, text: $text)
                }else{
                    TextField(placeholderText, text: $text)
                }
            }
            
            Divider()
                .background(Color(.darkGray))
        }
        .padding(.leading)
    }
}

struct CustominputField_Previews: PreviewProvider {
    // コンストラクタ？
    static var previews: some View {
        CustominputField(imageName:"envelope",
                         placeholderText: "Email",
                         isSecureField: false,
                         text: .constant(""))
    }
}
