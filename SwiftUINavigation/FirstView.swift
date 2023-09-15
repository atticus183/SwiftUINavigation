//
//  FirstView.swift
//  SwiftUINavigation
//
//  Created by Josh Rondestvedt on 9/9/23.
//

import SwiftUI

struct FirstView: View {
    @EnvironmentObject private var coordinator: Coordinator

    var body: some View {
        VStack {
            Button("Go to next page") {
                coordinator.push(.second)
            }
            Button("Pop") {
                coordinator.pop()
            }
        }
    }
}

// MARK: - SwiftUI Preview

#Preview {
    FirstView()
}
