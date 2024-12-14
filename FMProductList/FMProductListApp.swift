//
//  FMProductListApp.swift
//  FMProductList
//
//  Created by Rachel Radford on 10/26/24.
//

import SwiftUI
import SwiftData

@main
struct FMProductListApp: App {
  let container = try! ModelContainer(for: ItemModel.self, OrderModel.self)
  @StateObject var updater: ProductUpdater = ProductUpdater()
  let dataImporter: DataImporter
    @StateObject var orderVM: OrderViewModel = OrderViewModel()
  
  init() {
    self.dataImporter = DataImporter(context: container.mainContext, loader: ProductLoader())
  }
  
  var body: some Scene {
    WindowGroup {
      ContentView()
            .environmentObject(updater)
               .environmentObject(orderVM)
        .task {
          do {
            try await dataImporter.importData()
          } catch {
            print(error)
          }
        }
    }
    .modelContainer(for: [ItemModel.self, OrderModel.self])
  }
}
