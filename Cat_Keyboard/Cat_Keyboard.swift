//
//  Cat_Keyboard.swift
//  Cat_Keyboard
//
//  Created by 上野友綺 on 2024/07/07.
//

import SwiftUI
import AVFoundation

class CatKeyboard: ObservableObject {
    private var audioPlayers: [AVAudioPlayer] = []
    private var currentAudioPlayer: AVAudioPlayer?

    init() {
        loadAudioFiles()
    }

    private func loadAudioFiles() {
        for i in 1...3 { // CatSound1.mp3, CatSound2.mp3, CatSound3.mp3 があると仮定
            let fileName = "CatSound\(i)"
            if let asset = NSDataAsset(name: fileName) {
                do {
                    let audioPlayer = try AVAudioPlayer(data: asset.data, fileTypeHint: "mp3")
                    audioPlayer.prepareToPlay()
                    audioPlayers.append(audioPlayer)
                    print("Audio file \(fileName) loaded successfully")
                } catch {
                    print("Failed to load audio file \(fileName): \(error)")
                }
            } else {
                print("Audio file \(fileName) not found")
            }
        }
    }

    func playRandomSound() {
        guard !audioPlayers.isEmpty else {
            print("No audio files loaded")
            return
        }
        let randomIndex = Int.random(in: 0..<audioPlayers.count)
        currentAudioPlayer = audioPlayers[randomIndex]
        currentAudioPlayer?.play()
    }
}

