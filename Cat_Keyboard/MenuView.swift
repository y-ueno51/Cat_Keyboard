//
//  MenuView.swift
//  Cat_Keyboard
//
//  Created by 上野友綺 on 2024/07/09.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack {
            Text("Cat Keyboard")
                .font(.headline)
                .padding()
            Button("Quit") {
                NSApplication.shared.terminate(nil)
            }
            .padding()
        }
        .frame(width: 200, height: 100)
    }
}

#Preview {
    MenuView()
}
