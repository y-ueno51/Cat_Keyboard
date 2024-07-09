//
//  Cat_Keyboard.swift
//  Cat_Keyboard
//
//  Created by 上野友綺 on 2024/07/07.
//

import SwiftUI
import AVFoundation

class CatKeyboard: ObservableObject {
    private var audioPlayer: AVAudioPlayer?

    init() {
        loadAudioFile(named: "CatSound1")
    }

    private func loadAudioFile(named fileName: String) {
        if let asset = NSDataAsset(name: fileName) {
            do {
                audioPlayer = try AVAudioPlayer(data: asset.data, fileTypeHint: "mp3")
                audioPlayer?.prepareToPlay()
                print("Audio file \(fileName) loaded successfully")
            } catch {
                print("Failed to load audio file \(fileName): \(error)")
            }
        } else {
            print("Audio file \(fileName) not found")
        }
    }

    func playSound() {
        guard let player = audioPlayer else {
            print("Audio player is nil")
            return
        }
        player.play()
    }
}
