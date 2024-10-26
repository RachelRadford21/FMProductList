//
//  ReachabilityTests.swift
//  FMProductListTests
//
//  Created by Rachel Radford on 10/26/24.
//

import Testing
import Foundation
@testable import FMProductList

struct ReachabilityTests {
    let productLoader = ProductLoader()

    @Test func testAPIReachability() async throws {
       
        // Act: Try fetching products from the API
        let products = try await productLoader.fetchProducts()

        // Assert: Ensure the fetch was successful by checking if products are fetched
        #expect(!products.isEmpty, "Expected API to return products, but received none")
    }
    
    @Test func testAPIStatusCode() async throws {
        guard let url = URL(string: "https://api.npoint.io/865c4ff0d32e3909acc3") else { return }
           
           // Act: Fetch data from the URL
        let (_, response) = try await URLSession.shared.data(from: url)
           
           // Assert: Ensure a valid HTTP response was received
        guard let httpResponse = response as? HTTPURLResponse else { return }
           // Assert: Check the HTTP status code
           #expect(httpResponse.statusCode == 200, "Expected status code 200, but got \(httpResponse.statusCode)")
    }
    
    @Test func testAPILatency() async throws {
        // Arrange: Set a timeout duration
        let timeoutDuration: TimeInterval = 5.0 // 5 seconds

        // Act: Measure the time it takes to fetch the API
        let startTime = Date()
        let productLoader = ProductLoader()

        let endTime = Date()
        let timeElapsed = endTime.timeIntervalSince(startTime)

        // Assert: Ensure the API responded within the timeout duration
        #expect(timeElapsed < timeoutDuration, "API call took too long (\(timeElapsed) seconds)")
    }
}
