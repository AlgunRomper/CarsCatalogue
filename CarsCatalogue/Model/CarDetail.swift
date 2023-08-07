//
//  CarsList.swift
//  CarsCatalogue
//
//  Created by Algun Romper  on 03.08.2023.
//

import Foundation
import UIKit

struct CarDetail: Decodable, Hashable, Identifiable {
    var id: Int
    var brand_name: String
    var model_name: String
    var engine_name: String
    var year: Int
    var brand_id: Int
    var model_id: Int
    var engine_id: Int
    var transmission_id: Int
    var name: String
    var image: String?
    var loadedImage: UIImage?
    var thumbnail: String
    var transmission_name: String
    var engine_volume: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case brand_name
        case model_name
        case engine_name
        case year
        case brand_id
        case model_id
        case engine_id
        case transmission_id
        case name
        case image
        case thumbnail
        case transmission_name
        case engine_volume
    }
}
