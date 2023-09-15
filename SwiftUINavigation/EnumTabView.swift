//
//  EnumTabView.swift
//  SwiftUINavigation
//
//  Created by Josh Rondestvedt on 9/9/23.
//

import SwiftUI

struct EnumTabView: View {
    enum SheetDestination: String, Identifiable {
        case home, settings, profile

        var id: String { self.rawValue }
    }

    @State private var sheetDestination: SheetDestination?

    var body: some View {
        VStack(spacing: 20) {
            Button("Go Home") {
                sheetDestination = .home
            }
            Button("Go to Settings") {
                sheetDestination = .settings
            }
            Button("Go to Profile") {
                sheetDestination = .profile
            }
        }
        .sheet(item: $sheetDestination) { sheet in
            switch sheet {
            case .home:
                PresentedView(
                    name: sheet.rawValue,
                    image: .init(systemName: "house.fill")
                )
            case .settings:
                PresentedView(
                    name: sheet.rawValue,
                    image: .init(systemName: "gear")
                )
            case .profile:
                PresentedView(
                    name: sheet.rawValue,
                    image: .init(systemName: "person.fill")
                )
            }
        }
    }
}

// MARK: - SwiftUI Preview

#Preview {
    EnumTabView()
}
