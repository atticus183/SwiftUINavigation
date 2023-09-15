//
//  SheetCoordinatorTabView.swift
//  SwiftUINavigation
//
//  Created by Josh Rondestvedt on 9/9/23.
//

import SwiftUI

struct SheetCoordinatorTabView: View {
    @StateObject var sheetCoordinator = SheetCoordinator<CoordinatorTabViewSheetDestination>()

    var body: some View {
        VStack(spacing: 20) {
            Button("Go Home") {
                sheetCoordinator.presentSheet(.home)
            }
            Button("Go to Settings") {
                sheetCoordinator.presentSheet(.settings)
            }
            Button("Go to Profile") {
                sheetCoordinator.presentSheet(.profile)
            }
        }
        .sheetCoordinating(coordinator: sheetCoordinator)
    }
}

enum CoordinatorTabViewSheetDestination: String, Identifiable, SheetEnum {
    case home, settings, profile

    var id: String { rawValue }

    @ViewBuilder
    func view(coordinator: SheetCoordinator<CoordinatorTabViewSheetDestination>) -> some View {
        switch self {
        case .home:
            PresentedView(
                name: self.rawValue,
                image: .init(systemName: "house.fill")
            )
        case .settings:
            PresentedView(
                name: self.rawValue,
                image: .init(systemName: "gear")
            )
        case .profile:
            PresentedView(
                name: self.rawValue,
                image: .init(systemName: "person.fill")
            )
        }
    }
}

struct CoordinatorTabView_Previews: PreviewProvider {
    static var previews: some View {
        SheetCoordinatorTabView()
    }
}
