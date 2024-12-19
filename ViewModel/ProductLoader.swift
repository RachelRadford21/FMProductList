//
//  ProductLoader.swift
//  FMProductList
//
//  Created by Rachel Radford on 10/26/24.
//

import Foundation

struct ProductLoader {
   var localImages: [ImageModel] = []

     func fetchProducts() async throws -> [ItemModel] {
        guard let url = URL(string: "https://api.npoint.io/865c4ff0d32e3909acc3") else { return [] }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { return [] }
        let items = try JSONDecoder().decode([ItemModel].self, from: data)
        return items
    }
}
