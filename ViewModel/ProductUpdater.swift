//
//  ProductUpdater.swift
//  FMProductList
//
//  Created by Rachel Radford on 11/4/24.
//

import Foundation

class ProductUpdater: ObservableObject {
  // the total shown at top of cartview
  @Published var cartTotalCount: Int = 0
  // total number of items for each item in cartview
  @Published var cartQuantity: Int = 0
    // price of item in cartview
  @Published var cartItemPrice: Double = 0
  // the total amount for all items in cart view
  @Published var cartTotal: Double = 0

  
}
