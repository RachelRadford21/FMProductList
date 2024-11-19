//
//  ProductUpdater.swift
//  FMProductList
//
//  Created by Rachel Radford on 11/18/24.
//

import Foundation

class ProductUpdater: ObservableObject {
  // the total shown at top of cartview
    // Kinda wasteful but works well. Might delete or add other vars here??
  @Published var cartTotalCount: Int = 0
  
}
