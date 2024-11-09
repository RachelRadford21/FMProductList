//
//  CartViewModel.swift
//  FMProductList
//
//  Created by Rachel Radford on 11/3/24.
//

import Foundation
import SwiftData


struct OrderViewModel {
    var context: ModelContext
    let container = try! ModelContainer(for: OrderModel.self)
    
    init(
        context: ModelContext
    ) {
        self.context = context
    }
    
    func addItem(itemName: String, count: Int, price: Double, total: Double) {
        let newItem = OrderModel(id: UUID(), itemName: itemName, quantity: count, price: price, total: total)
        
        context.insert(newItem)
        
        saveContext()
    }
    
    func removeItem(itemName: String, count: Int, price: Double, total: Double) {
        let removeItem = OrderModel(id: UUID(), itemName: itemName, quantity: count, price: price, total: total)
      
        context.delete(removeItem)
        
        saveContext()
    }
    
    private func saveContext() {
        do {
            try context.save()
        } catch {
            print("Failed to save context: \(error)")
        }
    }
}
