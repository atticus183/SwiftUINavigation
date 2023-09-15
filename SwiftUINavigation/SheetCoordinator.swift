//
//  SheetCoordinator.swift
//  SwiftUINavigation
//
//  Created by Josh Rondestvedt on 9/9/23.
//

import SwiftUI

// Source: https://www.avanderlee.com/swiftui/presenting-sheets/

// MARK: - SheetEnum

protocol SheetEnum: Identifiable {
    associatedtype Body: View

    @ViewBuilder
    func view(coordinator: SheetCoordinator<Self>) -> Body
}

// MARK: - SheetCoordinator

final class SheetCoordinator<Sheet: SheetEnum>: ObservableObject {
    @Published var currentSheet: Sheet?
    private var sheetStack: [Sheet] = []

    @MainActor
    func presentSheet(_ sheet: Sheet) {
        sheetStack.append(sheet)

        if sheetStack.count == 1 {
            currentSheet = sheet
        }
    }

    @MainActor
    func sheetDismissed() {
        sheetStack.removeFirst()

        if let nextSheet = sheetStack.first {
            currentSheet = nextSheet
        }
    }
}

// MARK: - SheetCoordinating

struct SheetCoordinating<Sheet: SheetEnum>: ViewModifier {
    @StateObject var coordinator: SheetCoordinator<Sheet>

    func body(content: Content) -> some View {
        content
            .sheet(item: $coordinator.currentSheet, onDismiss: {
                coordinator.sheetDismissed()
            }, content: { sheet in
                sheet.view(coordinator: coordinator)
            })
    }
}

// MARK: - View Modifier

extension View {
    func sheetCoordinating<Sheet: SheetEnum>(coordinator: SheetCoordinator<Sheet>) -> some View {
        modifier(SheetCoordinating(coordinator: coordinator))
    }
}
