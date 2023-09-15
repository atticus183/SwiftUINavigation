//
//  FirstView.swift
//  SwiftUINavigation
//
//  Created by Josh Rondestvedt on 9/9/23.
//

import SwiftUI

struct BoolTabView: View {
    @State private var isPresented: Bool = false

    var body: some View {
        Button("Present") {
            isPresented.toggle()
        }
        .sheet(isPresented: $isPresented) {
            PresentedView(
                name: "From BoolTabView",
                image: .init(systemName: "flag.checkered")
            )
        }
    }
}

// MARK: - SwiftUI Preview

#Preview {
    BoolTabView()
}
