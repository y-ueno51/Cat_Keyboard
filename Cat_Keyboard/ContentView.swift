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
        VStack {
            Text("Enjoy Your Life with Cats!")
                .padding()
        }
        .onAppear {
            setupKeyHandler()
        }
    }
    
    private func setupKeyHandler() {
        NSEvent.addLocalMonitorForEvents(matching: .keyDown) { event in
            catKeyboard.playRandomSound()  // どのキーが押されても音を再生する
            return event
        }
    }
}
//        NSEvent.addLocalMonitorForEvents(matching: .keyDown) { event in
//            if event.charactersIgnoringModifiers == "a" {
//                catKeyboard.playSound()
//            }
//            return event
//        }
//    }
//}
