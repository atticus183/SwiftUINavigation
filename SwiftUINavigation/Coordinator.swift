//
//  Coordinator.swift
//  SwiftUINavigation
//
//  Created by Josh Rondestvedt on 9/14/23.
//

import SwiftUI

// Source: https://youtu.be/aaLRST7tHFQ?si=W_HN3HXBp26i5iye

enum Page: String, Identifiable {
    case first
    case second

    var id: String { rawValue }
}

enum Sheet: String, Identifiable {
    case presentedView

    var id: String { rawValue }
}

class Coordinator: ObservableObject {
    @Published var path = NavigationPath()
    @Published var sheet: Sheet?

    func push(_ page: Page) {
        path.append(page)
    }

    func present(sheet: Sheet) {
        self.sheet = sheet
    }

    func pop() {
        path.removeLast()
    }

    func dismiss() {
        self.sheet = nil
    }

    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .first:
            FirstView()
        case .second:
            SecondView()
        }
    }

    @ViewBuilder
    func build(sheet: Sheet) -> some View {
        switch sheet {
        case .presentedView:
            PresentedView(name: "From Coordinator", image: Image(systemName: "checkmark"))
        }
    }
}
