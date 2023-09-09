//
//  SecondView.swift
//  SwiftUINavigation
//
//  Created by Josh Rondestvedt on 9/9/23.
//

import SwiftUI

struct ShoppingItem: Identifiable {
    let id = UUID()
    let name: String

    static let list: [ShoppingItem] = [
        ShoppingItem(name: "Milk"),
        ShoppingItem(name: "Bread"),
        ShoppingItem(name: "Sugar"),
    ]
}

struct ItemTabView: View {
    @State private var selectedItem: ShoppingItem?

    var body: some View {
        List {
            ForEach(ShoppingItem.list) { item in
                Button(item.name) {
                    selectedItem = item
                }
            }
        }
        .sheet(item: $selectedItem) { item in
            PresentedView(name: item.name, image: .init(systemName: "cart.fill"))
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        ItemTabView()
    }
}
