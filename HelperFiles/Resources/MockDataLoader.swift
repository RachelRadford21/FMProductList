//
//  MockDataLoader.swift
//  FMProductListUITests
//
//  Created by Rachel Radford on 1/7/25.
//

import SwiftUI
@testable import FMProductList

struct MockDataUtility {
    static func loadMockItems() -> [ItemModel] {
      guard let url = Bundle.main.url(forResource: "MockItems", withExtension: "json") else {
            fatalError("Failed to locate MockItems.json in test bundle")
        }
        
        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode([ItemModel].self, from: data)
        } catch {
            fatalError("Failed to decode mock data: \(error)")
        }
    }
}
