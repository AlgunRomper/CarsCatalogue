//
//  CarDetail.swift
//  CarsCatalogue
//
//  Created by Algun Romper  on 03.08.2023.
//

import Foundation
import UIKit

struct CarUser: Decodable, Hashable, Identifiable {
    var id: Int
    var username: String
    var email: String
    var avatar: Avatar
    var auto_count: Int
    var main_auto_name: String
    
    struct Avatar: Decodable, Hashable {
        var url: String?
    }
    
    var loadedAvatar: UIImage?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case username
        case email
        case avatar
        case auto_count
        case main_auto_name
    }
}
