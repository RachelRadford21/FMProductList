//
//  ItemModel.swift
//  FMProductList
//
//  Created by Rachel Radford on 10/26/24.
//

import Foundation
import SwiftData

@Model
class ItemModel: Decodable {
    @Attribute(.unique) var image: ImageModel
   
    @Attribute(.unique) var name: String
    var category: String
    var price: Double
    
    init(
    image: ImageModel,
    name: String = "",
    category: String = "",
    price: Double = 0.0
    ) {
        self.image = image
        self.name = name
        self.category = category
        self.price = price
    }
    
    enum CodingKeys: String, CodingKey {
            case image
            case name
            case category
            case price
        }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        image = try container.decode(ImageModel.self, forKey: .image)
        name = try container.decode(String.self, forKey: .name)
        category = try container.decode(String.self, forKey: .category)
        price = try container.decode(Double.self, forKey: .price)
        }
}

