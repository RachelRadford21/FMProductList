//
//  OrderModel.swift
//  FMProductList
//
//  Created by Rachel Radford on 10/31/24.
//

import Foundation
import SwiftData

@Model
class OrderModel: Encodable {
  var id: UUID
  var itemName: String
  var quantity: Int
  var price: Double
  var total: Double
  
  init(
    id: UUID = .init(),
    itemName: String = "",
    quantity: Int = 0,
    price: Double = 0,
    total: Double = 0
  ) {
    self.id = id
    self.itemName = itemName
    self.quantity = quantity
    self.price = price
    self.total = total
  }
  
  enum CodingKeys: String, CodingKey {
    case id
    case itemName
    case quantity
    case price
    case total
  }
  
  required init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
    self.id = try container.decode(UUID.self, forKey: .id)
    self.itemName = try container.decode(String.self, forKey: .itemName)
    self.quantity = try container.decode(Int.self, forKey: .quantity)
    self.price = try container.decode(Double.self, forKey: .price)
    self.total = try container.decode(Double.self, forKey: .total)
  }
    
    func encode(to encoder: any Encoder) throws {
            
    }
}