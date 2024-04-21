//
//  ImagePicker.swift
//  TwitterClone
//
//  Created by Kakeru Imada on 2024/04/21.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable{
    
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var presentationMode
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> some UIViewController{
        let picker  = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewCOntoroller: UIViewControllerType, context: Context){
        
    }
}

extension ImagePicker{
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
        let parent: ImagePicker
        
        init(_ parent: ImagePicker){
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let image = info[.originalImage] as? UIImage else{return}
            parent.selectedImage = image
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}

