//
//  FMProductListTests.swift
//  FMProductListTests
//
//  Created by Rachel Radford on 10/26/24.
//

import Testing
import Foundation
@testable import FMProductList

struct FMProductListTests {
    let productLoader = ProductLoader()
  
    @Test func testFetchProducts() async throws {
    
           // Act: Fetch products
           let products = try await productLoader.fetchProducts()

           // Assert: Expect correct number of products
           #expect(products.count == 9, "Expected 9 products, but got \(products.count)")
        
           #expect(products.first?.name == "Waffle with Berries", "Expected product name 'Waffle with Berries', but got \(products.first?.name ?? "nil")")
        
           #expect(products.first?.price == 6.50, "Expected product price 6.50, but got \(products.first?.price ?? 0)")
       }
}


