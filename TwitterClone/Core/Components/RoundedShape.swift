//
//  RoundedShape.swift
//  TwitterClone
//
//  Created by Kakeru Imada on 2024/04/17.
//

import SwiftUI
import Foundation

struct RoundedShape: Shape{
    var corners: UIRectCorner
    
    func path(in rect: CGRect)->Path{
        let path = UIBezierPath(roundedRect:rect , byRoundingCorners: corners, cornerRadii: CGSize(width: 80, height: 80))
        
        return Path(path.cgPath)
    }
}
