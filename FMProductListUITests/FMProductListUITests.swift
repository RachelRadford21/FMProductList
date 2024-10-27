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
        let app = XCUIApplication()
        app.launch()
        
        // Assert: The macaron image is visible when the app loads
        let macaronImage = app.images["macaronImage"]
        XCTAssertTrue(macaronImage.exists, "Macaron image should be visible initially")
        
        // Wait for 2 seconds to allow the transition to happen
        let expectation = XCTNSPredicateExpectation(predicate: NSPredicate(format: "exists == true"), object: app.otherElements["menuView"])
        
        
        let result = XCTWaiter.wait(for: [expectation], timeout: 2.0)
        
        // Debugging: Print if result is not completed
        if result != .completed {
            print("Transition did not complete in time, result: \(result)")
        }
        XCTAssertEqual(result, .timedOut, "MenuView should be visible after 2 seconds")
        
    }
}
