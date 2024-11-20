//
//  CartItemView.swift
//  FMProductList
//
//  Created by Rachel Radford on 11/10/24.
//

import SwiftUI
import SwiftData

struct CartItemView: View {
    
    var itemName: String
    var quantity: Int
    var price: Double
    var total: Double
    
    init(
        itemName: String = "",
        quantity: Int = 0,
        price: Double = 0,
        total: Double = 0
    ) {
        self.itemName = itemName
        self.quantity = quantity
        self.price = price
        self.total = total
    }
    
    var body: some View {
        if quantity > 0 {
            Text("\(itemName)")
                .font(.custom("RedHatText-SemiBold", size: 18))
                .foregroundStyle(Color.black.opacity(0.9))
            
            HStack(spacing: 10) {
                Text("\(quantity)x")
                    .font(.custom("RedHatText-Bold", size: 17))
                    .foregroundStyle(Color.buttonBackground)
                Text("@ \(price, format: .currency(code: "USD"))")
                    .font(.custom("RedHatText-Regular", size: 17))
                    .foregroundStyle(Color.catFontColor)
                Text("\(total, format: .currency(code: "USD"))")
                    .font(.custom("RedHatText-SemiBold", size: 17))
                    .foregroundStyle(Color.catFontColor).brightness(-0.2)
            }
            .padding(.vertical, 5)
            dividerView
        }
    }
}

extension CartItemView {
    var dividerView: some View {
        Divider()
            .foregroundStyle(Color.catFontColor)
            .brightness(-0.2)
            .padding(.horizontal)
    }
}

//#Preview {
//    CartItemView()
//}
