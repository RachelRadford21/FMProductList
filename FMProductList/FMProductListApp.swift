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
    let container = try! ModelContainer(for: ItemModel.self)
    let productLoader = ProductLoader()
    
    let dataImporter: DataImporter
    
    init() {
        self.dataImporter = DataImporter(context: container.mainContext, loader: productLoader)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
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
