//
//  PhotoSelecterView.swift
//  TwitterClone
//
//  Created by Kakeru Imada on 2024/04/20.
//

import SwiftUI

struct ProfilePhotoSelecterView: View {
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        VStack{
            AuthenticaionView(title1:"Create your accout" ,
                              title2: "Select a photo")
            
            Button{
                showImagePicker.toggle()
            }label: {
                if let profileImage = profileImage{
                    profileImage
                        .resizable()
                        .modifier(ProfileImageModifier())
                }else{
                    Image(systemName:"person")
                        .resizable()
                        .renderingMode(.template)
                        .modifier(ProfileImageModifier())
                }
            }
            .sheet(isPresented: $showImagePicker , onDismiss: loadImage){
                ImagePicker(selectedImage: $selectedImage)
            }
            .padding(.top,44)
            
            if selectedImage != nil{
                Button{
                    if let image = selectedImage{
                        viewModel.uploadProfileImage(image)
                    }
                }label: {
                    Text("Continue")
                        .font(.headline)
                        .fontWeight(.bold)
                        .frame(width:300,height:50)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
                .shadow(color:.gray.opacity(0.5), radius: 10, x:0, y:0)
            }
            Spacer()
        }
        .ignoresSafeArea()
    }
    
    func loadImage(){
        guard let selectedImage = selectedImage else{return}
        profileImage = Image(uiImage: selectedImage)
    }
}


private struct ProfileImageModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color(.systemPink))
            .scaledToFit()
            .frame(width: 180,height: 180)
            .clipShape(Circle())
    }
}
struct ProfilePhotoSelecterView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelecterView()
    }
}
