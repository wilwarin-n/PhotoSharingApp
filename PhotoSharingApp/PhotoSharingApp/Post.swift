//
//  Post.swift
//  PhotoSharingApp
//
//  Created by Aydın Kutlu on 7.07.2024.
//

import Foundation

class Post{
    var email : String
    var comment : String
    var imageUrl: String
    
    init(email: String, comment: String, imageUrl: String) {
        self.email = email
        self.comment = comment
        self.imageUrl = imageUrl
    }
}


