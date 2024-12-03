//
//  ButtonView.swift
//  FMProductList
//
////  Created by Rachel Radford on 10/26/24.
////
//
import SwiftUI
import SwiftData

struct ButtonView: View {
    @Environment(\.modelContext) var context
    @EnvironmentObject var updater: ProductUpdater
    var orderVM: OrderViewModel?
    var item: ItemModel
    var order: OrderModel
    @Binding var count: Int
    @Binding var addToCart: Bool
    @Binding var itemName: String
    @Binding var price: Double
    @State private var total: Double = 0
    
    public init(
        item: ItemModel = .init(image: ImageModel(), name: "", category: "", price: 0),
        orderVM: OrderViewModel?,
        order: OrderModel = OrderModel(),
        count: Binding<Int> = .constant(0),
        addToCart: Binding<Bool> = .constant(false),
        itemName: Binding<String> = .constant(""),
        price: Binding<Double> = .constant(0)
    ) {
        self.item = item
        self.orderVM = orderVM
        self.order = order
        self._count = count
        self._addToCart = addToCart
        self._itemName = itemName
        self._price = price
    }
    var body: some View {
        buttonView
    }
}

extension ButtonView {
    
    @ViewBuilder
    var buttonView: some View {
        addToCartButton()
            .accessibilityIdentifier("addToCartButton")
        
        if addToCart {
            cartCountButton()
        }
    }
    
    func addToCartButton() -> some View {
        Button {
            addToCart.toggle()
        } label: {
            buttonLabelView
                .overlay {
                    HStack(spacing: 5) {
                        Image("icon-add-to-cart")
                        Text("Add to Cart")
                            .foregroundStyle(Color.black)
                            .font(.custom("RedHatText-SemiBold", size: 12))
                    }
                }
        }
        .accessibilityIdentifier("addToCartButton")
        .opacity(addToCartOpacity)
    }
    
    func cartCountButton() -> some View {
        Button {
            addToCart.toggle()
        } label: {
            buttonLabelView
                .overlay {
                    HStack {
                        subtractButton
                        Spacer()
                        countTextView
                        Spacer()
                        addButton
                    }
                    .padding(.horizontal, 12)
                    .opacity(countOpacity)
                }
        }
        .accessibilityIdentifier("cartCountButton")
        .onChange(of: updater.isRowDeleted) {
            // MARK: THIS MOSTLY WORKS. I NEED TO FIGURE OUT WHY ITS RESETTING THE COUNT ON THE WRONG BUTTON. IT IS SETTING THE ITEM I DELETED TO 1 AND THE ORDERS I AM KEEPING TO 0. IF IT IS THE ONLY ITEM BEING DELETED, IT WORKS AS EXPECTED. ALSO, IF MORE THAN ONE ITEM IS ADDED TO CART THE HIGHLIGHT DOESNT GET REMOVED ON ROW DELETION AND THE COUNT IS OFF. Possibly keeping the last added value
            
            if updater.isRowDeleted {
                addToCart = false
            }
            if !addToCart {
                updater.setCount(for: item.name, to: 0)
            }
            updater.isRowDeleted = false
           
        }
    }
    var subtractButton: some View {
        countButton(imageName: "icon-decrement-quantity") {
            subtractValues()
            
        }
    }
    
    var countTextView: some View {
        Text("\(count)")
            .font(.custom("RedHatText-SemiBold", size: 15))
            .foregroundStyle(Color.white)
            .accessibilityIdentifier("countLabel")
    }
    
    var addButton: some View {
        countButton(imageName: "icon-increment-quantity") {
            addValues()
            
        }
    }
    var buttonLabelView: some View {
        Capsule(style: .continuous)
            .strokeBorder(labelBorderColor)
            .frame(width: 155, height: 40)
            .background(buttonBackgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 25))
    }
    
    var addToCartOpacity: CGFloat {
        addToCart ? 0 : 1
    }
    
    var countOpacity: CGFloat {
        addToCart ? 1 : 0
    }
    
    var labelBorderColor: Color {
        addToCart ? Color.clear : Color.black.opacity(0.5)
    }
    
    var buttonBackgroundColor: Color {
        addToCart ? Color.buttonBackground : Color.white
    }
    
    func countButton(imageName: String, action: (() -> Void)? ) ->  some View {
        Button {
            action?()
            neutralCount()
        } label: {
            Circle()
                .strokeBorder(Color.white, lineWidth: 1)
                .frame(width: 15, height: 15)
                .overlay {
                    Image(imageName)
                }
        }
    }
    
    func subtractValues() {
        if count > 0 {
            count -= 1
            updater.cartTotalCount -= 1
            total -= price
        } else if count == 0 {
            itemName = ""
            price = 0
            orderVM?.removeItem(itemName: itemName, count: count, price: price, total: total)
        }
        orderVM?.removeItem(itemName: itemName, count: count, price: price, total: total)
        updater.orderTotal -= price
    }
    
    func neutralCount() {
        orderVM?.addItem(itemName: itemName, count: count, price: price, total: total)
        if count == 0 {
            do {
                try context.delete(model: OrderModel.self, where: #Predicate { order in
                    order.itemName == item.name
                })
            } catch {
                print("error: \(error)")
            }
        }
    }
    
    func addValues() {
        count += 1
        itemName = item.name
        price = item.price
        total += price
        // This doesnt work as expected here but works in neutral() ??
         //   orderVM?.addItem(itemName: itemName, count: count, price: price, total: total)
        updater.cartTotalCount += 1
        updater.orderTotal += price
    }
}

