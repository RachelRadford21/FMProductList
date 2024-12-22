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
    
    func addItem(itemName: String, count: Int, price: Double, total: Double, image: String) {
        let newItem = OrderModel(id: UUID(), itemName: itemName, quantity: count, price: price, total: total, image: image)
        
        context.insert(newItem)
        
        saveContext()
       
    }

    func removeItem(itemName: String, count: Int, price: Double, total: Double, image: String? = nil) {
     
        let removeItem = OrderModel(id: UUID(), itemName: itemName, quantity: count, price: price, total: total, image: image ?? "")
        
        context.delete(removeItem)
     
        saveContext()
    }

  func fetchOrders() {
      do {
          let fetchDescriptor = FetchDescriptor<OrderModel>(sortBy: [
              SortDescriptor(\.itemName, order: .forward)
          ])
          
          let fetchedOrders = try context.fetch(fetchDescriptor)
          
          DispatchQueue.main.async {
              self.orders = fetchedOrders
              self.groupOrdersByProduct(orders: fetchedOrders)
          }
      } catch {
          print("Failed to fetch orders: \(error)")
      }
  }
  
    func groupOrdersByProduct(orders: [OrderModel]) {
        for order in orders {
            if let existingOrder = groupedOrders[order.itemName] {
                existingOrder.quantity = order.quantity
                existingOrder.total = order.total
             
            } else {
                groupedOrders[order.itemName] = order
            }
        }
    }
    
  
    private func saveContext() {
        do {
            try context.save()
        } catch {
            print("Failed to save context: \(error)")
        }
    }
}
