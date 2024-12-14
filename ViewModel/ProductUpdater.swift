//
//  ProductUpdater.swift
//  FMProductList
//
//  Created by Rachel Radford on 11/18/24.
//

import Foundation

class ProductUpdater: ObservableObject {
    
  @Published var cartTotalCount: Int = 0
  @Published var orderTotal: Double = 0
  @Published var productCounts: [String: Int] = [:]
  @Published var isRowDeleted: Bool = false
  @Published var itemName: String = ""
 
  func setCount(for productName: String, to count: Int) {
    productCounts[productName] = count
    print("name: \(productName), count: \(count)")
  }
  
  func getCount(for productName: String) -> Int {
    productCounts[productName] ?? 0
  }
}
