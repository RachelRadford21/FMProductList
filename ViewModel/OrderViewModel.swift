//
//  CartViewModel.swift
//  FMProductList
//
//  Created by Rachel Radford on 11/3/24.
//

import Foundation
import SwiftData

class OrderViewModel: ObservableObject {
    let context: ModelContext
     @Published var orders: [OrderModel] = []
     @Published var groupedOrders: [String : OrderModel] = [:]

     init(
        context: ModelContext? = nil
     ) {
         if let providedContext = context {
             self.context = providedContext
         } else {
             let container = try! ModelContainer(for: OrderModel.self)
             self.context = ModelContext(container)
         }
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
    
    func groupOrdersByProduct(orders: [OrderModel]) {
//        let grouped: [String : OrderModel] = [:]
        
        for order in orders {
            if let existingOrder = groupedOrders[order.itemName] {
                existingOrder.quantity = order.quantity
                existingOrder.total = order.total
            } else {
                groupedOrders[order.itemName] = order
            }
        }
//        groupedOrders = grouped
    }
    
    private func saveContext() {
        do {
            try context.save()
        } catch {
            print("Failed to save context: \(error)")
        }
    }
}
