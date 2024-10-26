//
//  DataImporter.swift
//  FMProductList
//
//  Created by Rachel Radford on 10/26/24.
import SwiftData

    struct DataImporter {
        let context: ModelContext
        let loader: ProductLoader
    
        let container = try! ModelContainer(for: ItemModel.self)
        
        @MainActor
        func importData() async throws {
            let context = container.mainContext
            let productDescriptor = FetchDescriptor<ItemModel>()
            let products = try await loader.fetchProducts()
            let presistedProducts = try context.fetch(productDescriptor)
            if presistedProducts.isEmpty {
                if !products.isEmpty {
                    products.forEach { item in
                        let productModel = ItemModel(image: item.image, name: item.name, category: item.category, price: item.price)
                        context.insert(productModel)
                        
                    }
                    if context.hasChanges {
                        try context.save()
                    }
                    try context.save()
                }
            }
        }
    }

