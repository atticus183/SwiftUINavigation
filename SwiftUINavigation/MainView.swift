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

            CoordinatorTabView()
                .tabItem {
                    Label("Coordinator", systemImage: "car")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
