//
//  OrderModel.swift
//  FMProductList
//
//  Created by Rachel Radford on 10/31/24.
//

import Foundation
import SwiftData

@Model
class OrderModel {
  @Attribute var id: UUID
  @Attribute var itemName: String
  @Attribute var quantity: Int
  @Attribute var price: Double
  @Attribute var total: Double
  @Attribute var orderTotal: Double
  @Attribute var image: String
  
  init(
    id: UUID = UUID(),
    itemName: String = "",
    quantity: Int = 0,
    price: Double = 0,
    total: Double = 0,
    orderTotal: Double = 0,
    image: String = ""
  ) {
    self.id = id
    self.itemName = itemName
    self.quantity = quantity
    self.price = price
    self.total = total
    self.orderTotal = orderTotal
    self.image = image
  }
  
  enum CodingKeys: String, CodingKey {
    case id
    case itemName
    case quantity
    case price
    case total
    case orderTotal
    case image
  }
  
  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.id = try container.decode(UUID.self, forKey: .id)
    self.itemName = try container.decode(String.self, forKey: .itemName)
    self.quantity = try container.decode(Int.self, forKey: .quantity)
    self.price = try container.decode(Double.self, forKey: .price)
    self.total = try container.decode(Double.self, forKey: .total)
    self.orderTotal = try container.decode(Double.self, forKey: .orderTotal)
    self.image = try container.decode(String.self, forKey: .image)
  }
}
