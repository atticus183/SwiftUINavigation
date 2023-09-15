//
//  SecondView.swift
//  SwiftUINavigation
//
//  Created by Josh Rondestvedt on 9/14/23.
//

import SwiftUI

struct SecondView: View {
    @EnvironmentObject private var coordinator: Coordinator

    var body: some View {
        VStack {
            Button("Present") {
                coordinator.present(sheet: .presentedView)
            }
            Button("Pop") {
                coordinator.pop()
            }
        }
    }
}

#Preview {
    SecondView()
}
