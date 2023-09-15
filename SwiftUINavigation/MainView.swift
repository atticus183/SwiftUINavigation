//
//  ContentView.swift
//  SwiftUINavigation
//
//  Created by Josh Rondestvedt on 9/9/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            BoolTabView()
                .tabItem {
                    Label("Bool", systemImage: "iphone")
                }

            ItemTabView()
                .tabItem {
                    Label("Item", systemImage: "cart")
                }

            EnumTabView()
                .tabItem {
                    Label("Enum", systemImage: "gear.circle")
                }

            SheetCoordinatorTabView()
                .tabItem {
                    Label("Coordinator", systemImage: "car")
                }
        }
    }
}

// MARK: - SwiftUI Preview

#Preview {
    MainView()
}
