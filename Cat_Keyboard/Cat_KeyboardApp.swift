//
//  Cat_KeyboardApp.swift
//  Cat_Keyboard
//
//  Created by 上野友綺 on 2024/07/07.
//

import SwiftUI

@main
struct Cat_KeyboardApp: App {
    var body: some Scene {
        MenuBarExtra {
            ContentView()
            Button("Quit") {
                NSApplication.shared.terminate(nil)
            }.keyboardShortcut("q")
        } label: {
            Label("Cat Keyboard", systemImage: "cat.fill")
        }
        .menuBarExtraStyle(.window)
    }
}
