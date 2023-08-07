//
//  CarPosts.swift
//  CarsCatalogue
//
//  Created by Algun Romper  on 03.08.2023.
//

import Foundation
import UIKit

struct CarPosts: Decodable, Hashable, Identifiable {
    
    var id: Int?
    var text: String?
    var created_at: String
    var img: String?
    var loadedImage: UIImage?
    var like_count: Int?
    var comment_count: Int?
    var author: Author

    struct Author: Decodable, Hashable {
        var id: Int
        var username: String
        var avatar: Avatar
        var auto_count: Int
        var main_auto_name: String
        
        struct Avatar: Decodable, Hashable {
            var url: String?
        }
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case text
        case created_at
        case img
        case like_count
        case comment_count
        case author
    }
}
