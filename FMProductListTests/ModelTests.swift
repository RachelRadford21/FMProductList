//
//  ModelTests.swift
//  FMProductListTests
//
//  Created by Rachel Radford on 11/2/24.
//

import Testing
import Foundation
import XCTest
@testable import FMProductList

struct ItemModelTests {
  
  @Test
  func item_model_test() async throws {
    
    let item = ItemModel(image: ImageModel(), name: "Waffle with Berries", category: "Waffle", price: 6.5)
    
    #expect(item.name == "Waffle with Berries")
    #expect(item.category == "Waffle")
    #expect(item.price == 6.5)
    
  }
  // MARK: This test should not be passing??
//  @Test
//  func testCodableConformance() {
//    let jsonData = """
//            {
//                "name": "Waffle with Berries",
//                "category": "Waf",
//                "price": 6.5
//            }
//            """.data(using: .utf8)!
//            
//            let decoder = JSONDecoder()
//            
//            do {
//                let decodedItem = try decoder.decode(ItemModel.self, from: jsonData)
//
//                XCTAssertEqual(decodedItem.name, "Waffle with Berries", "Name does not match expected value")
//                XCTAssertEqual(decodedItem.category, "Waffle", "Category does not match expected value")
//                XCTAssertEqual(decodedItem.price, 6.5, accuracy: 0.001, "Price does not match expected value")
//              
//            } catch {
//                XCTFail("Decoding failed with error: \(error)")
//            }
//  }
}

struct ImageModelTests {
  
  @Test
  func image_model_test() throws {
    let image = ImageModel(thumbnail: "image-waffle-thumbnail.jpg", mobile: "image-waffle-mobile.jpg", tablet: "image-waffle-tablet.jpg", desktop: "image-waffle-desktop.jpg")
    
    #expect(image.thumbnail == "image-waffle-thumbnail.jpg")
    #expect(image.mobile == "image-waffle-mobile.jpg")
    #expect(image.tablet == "image-waffle-tablet.jpg")
    #expect(image.desktop == "image-waffle-desktop.jpg")
  }
  
  @Test
  func testCodableConformance() {
    let jsonData = """
           {
               "thumbnail": "image-waffle-thumbnail.jpg",
               "mobile": "image-waffle-mobile.jpg",
               "tablet": "image-waffle-tablet.jpg",
               "desktop": "image-waffle-desktop.jpg"
           }
           """.data(using: .utf8)!
    
    let decoder = JSONDecoder()
    
    do {
      // Decode JSON data into an ImageModel instance
      let decodedImage = try decoder.decode(ImageModel.self, from: jsonData)
      
      // Use `expect` assertions to verify each property
      #expect(decodedImage.thumbnail == "image-waffle-thumbnail.jpg", "Thumbnail does not match expected value")
      #expect(decodedImage.mobile == "image-waffle-mobile.jpg", "Mobile image does not match expected value")
      #expect(decodedImage.tablet == "image-waffle-tablet.jpg", "Tablet image does not match expected value")
      #expect(decodedImage.desktop == "image-waffle-desktop.jpg", "Desktop image does not match expected value")
      
    } catch {
      // Fail the test if decoding throws an error
      #expect(Bool(false), "Decoding failed with error: \(error)")
    }
  }
}
