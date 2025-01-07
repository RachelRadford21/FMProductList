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
  @Test func testCodableConformance() {
    let jsonData = """
            {
                "name": "Waffle with Berries",
                "category": "Waf",
                "price": 6.5
            }
            """.data(using: .utf8)!
            
            let decoder = JSONDecoder()
            
            do {
                let decodedItem = try decoder.decode(ItemModel.self, from: jsonData)

                XCTAssertEqual(decodedItem.name, "Waffle with Berries", "Name does not match expected value")
                XCTAssertEqual(decodedItem.category, "Waffle", "Category does not match expected value")
                XCTAssertEqual(decodedItem.price, 6.5, accuracy: 0.001, "Price does not match expected value")
              
            } catch {
                XCTFail("Decoding failed with error: \(error)")
            }
  }
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
   
      let decodedImage = try decoder.decode(ImageModel.self, from: jsonData)
     
      #expect(decodedImage.thumbnail == "image-waffle-thumbnail.jpg", "Thumbnail does not match expected value")
      #expect(decodedImage.mobile == "image-waffle-mobile.jpg", "Mobile image does not match expected value")
      #expect(decodedImage.tablet == "image-waffle-tablet.jpg", "Tablet image does not match expected value")
      #expect(decodedImage.desktop == "image-waffle-desktop.jpg", "Desktop image does not match expected value")
      
    } catch {

      #expect(Bool(false), "Decoding failed with error: \(error)")
    }
  }
}

struct OrderModelTests {
 
  @Test func testInitializationWithDefaults() {
        
          let order = OrderModel()

          XCTAssertNotNil(order.id, "ID should not be nil")
          XCTAssertEqual(order.itemName, "", "Default itemName should be empty")
          XCTAssertEqual(order.quantity, 0, "Default quantity should be 0")
          XCTAssertEqual(order.price, 0, "Default price should be 0")
          XCTAssertEqual(order.total, 0, "Default total should be 0")
          XCTAssertEqual(order.orderTotal, 0, "Default orderTotal should be 0")
          XCTAssertEqual(order.image, "", "Default image should be empty")
      }
  
      @Test func testInitializationWithCustomValues() {
  
          let id = UUID()
          let itemName = "Test Item"
          let quantity = 2
          let price = 10.0
          let total = 20.0
          let orderTotal = 50.0
          let image = "test-image.png"

          let order = OrderModel(
              id: id,
              itemName: itemName,
              quantity: quantity,
              price: price,
              total: total,
              orderTotal: orderTotal,
              image: image
          )

          XCTAssertEqual(order.id, id, "ID should match")
          XCTAssertEqual(order.itemName, itemName, "itemName should match")
          XCTAssertEqual(order.quantity, quantity, "quantity should match")
          XCTAssertEqual(order.price, price, "price should match")
          XCTAssertEqual(order.total, total, "total should match")
          XCTAssertEqual(order.orderTotal, orderTotal, "orderTotal should match")
          XCTAssertEqual(order.image, image, "image should match")
      }
  
  @Test func testPropertyUpdates() {

    let order = OrderModel()

    order.itemName = "Updated Item"
    order.quantity = 5
    order.price = 15.0
    order.total = 75.0
    order.orderTotal = 100.0
    order.image = "updated-image.png"

    XCTAssertEqual(order.itemName, "Updated Item")
    XCTAssertEqual(order.quantity, 5)
    XCTAssertEqual(order.price, 15.0)
    XCTAssertEqual(order.total, 75.0)
    XCTAssertEqual(order.orderTotal, 100.0)
    XCTAssertEqual(order.image, "updated-image.png")
}
  
  @Test func testSerialization() throws {
   
    let order = OrderModel(
        itemName: "Test Item",
        quantity: 3,
        price: 12.5,
        total: 37.5,
        orderTotal: 100.0,
        image: "test-image.png"
    )

   
    let encoder = JSONEncoder()
    let data = try encoder.encode(order)
    let json = String(data: data, encoding: .utf8)

    XCTAssertNotNil(json, "JSON string should not be nil")
    XCTAssertTrue(json?.contains("Test Item") ?? false, "JSON should contain itemName")
}
  
  @Test func testDeserialization() throws {

      let json = """
      {
          "id": "\(UUID().uuidString)",
          "itemName": "Test Item",
          "quantity": 3,
          "price": 12.5,
          "total": 37.5,
          "orderTotal": 100.0,
          "image": "test-image.png"
      }
      """
      let data = json.data(using: .utf8)!

      let decoder = JSONDecoder()
      let order = try decoder.decode(OrderModel.self, from: data)

      XCTAssertEqual(order.itemName, "Test Item")
      XCTAssertEqual(order.quantity, 3)
      XCTAssertEqual(order.price, 12.5)
      XCTAssertEqual(order.total, 37.5)
      XCTAssertEqual(order.orderTotal, 100.0)
      XCTAssertEqual(order.image, "test-image.png")
  }
}
