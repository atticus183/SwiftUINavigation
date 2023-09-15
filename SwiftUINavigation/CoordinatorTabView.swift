//
//  CoordinatorTabView.swift
//  SwiftUINavigation
//
//  Created by Josh Rondestvedt on 9/14/23.
//

import SwiftUI

struct CoordinatorTabView: View {

    @StateObject private var coordinator = Coordinator()

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            mainContent
                .navigationDestination(for: Page.self) {
                    coordinator.build(page: $0)
                }
                .sheet(item: $coordinator.sheet) {
                    coordinator.build(sheet: $0)
                }
        }
        .environmentObject(coordinator)
    }

    var mainContent: some View {
        Button("Push to first view") {
            coordinator.push(.first)
        }
    }
}

#Preview {
    CoordinatorTabView()
}
