//
//  ItemModel.swift
//  FMProductList
//
//  Created by Rachel Radford on 10/26/24.
//

import Foundation
import SwiftData

@Model
class ItemModel: Codable {
    @Attribute var image: ImageModel
    @Attribute var name: String
    @Attribute var category: String
    @Attribute var price: Double
    
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
      self.image = try container.decode(ImageModel.self, forKey: .image)
      self.name = try container.decode(String.self, forKey: .name)
      self.category = try container.decode(String.self, forKey: .category)
      self.price = try container.decode(Double.self, forKey: .price)
    }
  
    func encode(to encoder: any Encoder) throws {
      var container = encoder.container(keyedBy: CodingKeys.self)
          try container.encode(image, forKey: .image)
          try container.encode(name, forKey: .name)
          try container.encode(category, forKey: .category)
          try container.encode(price, forKey: .price)
    }
}

