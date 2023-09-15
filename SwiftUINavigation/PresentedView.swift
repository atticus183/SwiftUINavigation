//
//  PresentedView.swift
//  SwiftUINavigation
//
//  Created by Josh Rondestvedt on 9/9/23.
//

import SwiftUI

struct PresentedView: View {
    let name: String
    let image: Image

    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            VStack {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.blue)
                    .frame(height: 100)
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle(name)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Close") {
                                dismiss()
                            }
                        }
                    }

                NavigationLink("Go to Pushed") {
                    PushedView()
                }
            }
        }
    }
}

struct PresentedView_Previews: PreviewProvider {
    static var previews: some View {
        PresentedView(name: "name", image: .init(systemName: "minus.plus.batteryblock.fill"))
    }
}
