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
  let productLoader = ProductLoader()
  let dataImporter: DataImporter
  
  init() {
    self.dataImporter = DataImporter(context: container.mainContext, loader: productLoader)
  }
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(updater)
        .task {
          do {
            try await dataImporter.importData()
          } catch {
            print(error)
          }
        }
    }
    .modelContainer(container)
  }
}
