//
//  ImageUploader.swift
//  TwitterClone
//
//  Created by Kakeru Imada on 2024/04/21.
//

import UIKit
import SwiftUI
import FirebaseStorage
import Firebase

struct ImageUploader{
    //Scopeの外でも値を参照したいときに使う→＠escaping
    static func uploadImage(image: UIImage, completion: @escaping(String)-> Void){
        guard let imageData = image.jpegData(compressionQuality: 0.5) else{return}
        
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_image/\(filename)")
        
        ref.putData(imageData, metadata: nil){_, error in
            if let error = error{
                print("DEBUG: failed to upoload image with error: \(error.localizedDescription)")
                return
            }
            
            ref.downloadURL{ imageUrl, _ in
                guard let imageUrl = imageUrl?.absoluteString else{return}
                completion(imageUrl)
            }
        }
    }
}
