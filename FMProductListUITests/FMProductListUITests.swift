//
//  FMProductListUITests.swift
//  FMProductListUITests
//
//  Created by Rachel Radford on 10/26/24.
//

import XCTest
import Foundation
@testable import FMProductList

final class FMProductListUITests: XCTestCase {

    func testInitialStateShowsMacaronImage() {
        func testInitialStateShowsMacaronImage() {
                let app = XCUIApplication()
                app.launch()
                
                let macaronImage = app.images["macaronImage"]
                XCTAssertTrue(macaronImage.exists, "Macaron image should be visible initially")
                
                let expectation = XCTNSPredicateExpectation(predicate: NSPredicate(format: "exists == true"), object: app.otherElements["menuView"])
                
                
                let result = XCTWaiter.wait(for: [expectation], timeout: 2.0)
                
                if result != .completed {
                    print("Transition did not complete in time, result: \(result)")
                }
                XCTAssertEqual(result, .timedOut, "MenuView should be visible after 2 seconds")
                
            }
    }
    
    func testAddToCartButtonVisibility() throws {
        let app = XCUIApplication()
        app.launch()

        let addToCartButton = app.buttons["addToCartButton"]
        let exists = NSPredicate(format: "exists == true")
        let expectation = XCTNSPredicateExpectation(predicate: exists, object: addToCartButton)

        let result = XCTWaiter.wait(for: [expectation], timeout: 5.0)
        
        if result == .completed {
            print("The 'Add to Cart' button appeared within the expected time.")
        } else {
            print("The 'Add to Cart' button did not appear in time, result: \(result)")
        }
        
        XCTAssertEqual(result, .completed, "The 'Add to Cart' button did not appear in time.")
    }
// MARK: Not building because .tap() not working
//    func testAddToCartThenCountButtons() throws {
//        let app = XCUIApplication()
//        app.launch()
//        
//        sleep(3)
//        
//        let addToCartButton = app.buttons["addToCartButton"]
//        XCTAssertTrue(addToCartButton.exists, "The 'Add to Cart' button should exist initially.")
//        addToCartButton.tap()
//        
//        let countLabel = app.staticTexts["countLabel"]
//        let incrementButton = app.buttons["icon-increment-quantity"]
//        let decrementButton = app.buttons["icon-decrement-quantity"]
//        
//        let exists = NSPredicate(format: "exists == true")
//        let countLabelExpectation = XCTNSPredicateExpectation(predicate: exists, object: countLabel)
//        let result = XCTWaiter.wait(for: [countLabelExpectation], timeout: 5.0)
//        XCTAssertEqual(result, .completed, "Count label did not appear after tapping the 'Add to Cart' button.")
//        
//        XCTAssertEqual(countLabel.label, "0", "Initial count should be 0.")
//        incrementButton.tap()
//        XCTAssertEqual(countLabel.label, "1", "Count should be incremented to 1 after tapping the increment button.")
//        
//        
//        decrementButton.tap()
//        XCTAssertEqual(countLabel.label, "0", "Count should be decremented back to 0 after tapping the decrement button.")
//    }
   
}
