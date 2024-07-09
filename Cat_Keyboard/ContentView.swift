//
//  ContentView.swift
//  Cat_Keyboard
//
//  Created by 上野友綺 on 2024/07/07.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var catKeyboard = CatKeyboard()

    var body: some View {
        Text("Press 'A' to hear the cat sound")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .foregroundColor(Color.black)
            .onAppear {
                setupKeyListener()
            }
    }

    private func setupKeyListener() {
        NSEvent.addLocalMonitorForEvents(matching: .keyDown) { event in
            if event.charactersIgnoringModifiers == "a" {
                catKeyboard.playSound()
            }
            return event
        }
    }
}
