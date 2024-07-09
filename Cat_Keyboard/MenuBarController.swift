//
//  MenuBarController.swift
//  Cat_Keyboard
//
//  Created by 上野友綺 on 2024/07/09.
//

import Cocoa
import SwiftUI
import AVFoundation

class MenuBarController: NSObject, ObservableObject {
    private var statusItem: NSStatusItem?
    private var popover: NSPopover!
    private var audioPlayer: AVAudioPlayer?

    override init() {
        super.init()
        setupMenuBar()
        setupKeyListener()
    }

    private func setupMenuBar() {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        if let button = statusItem?.button {
            button.image = NSImage(named: NSImage.Name("Cat1"))
            button.action = #selector(togglePopover)
        } else {
            print("Failed to create status item")
        }

        popover = NSPopover()
        popover.contentViewController = NSHostingController(rootView: MenuView())
        popover.behavior = .transient
    }

    @objc private func togglePopover() {
        if let button = statusItem?.button {
            if popover.isShown {
                popover.performClose(nil)
            } else {
                popover.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
            }
        }
    }

    private func setupKeyListener() {
        NSEvent.addGlobalMonitorForEvents(matching: .keyDown) { [weak self] event in
            if event.charactersIgnoringModifiers == "a" {
                self?.playSound()
            }
        }
    }

    private func playSound() {
        guard let url = Bundle.main.url(forResource: "CatSound1", withExtension: "mp3") else {
            print("Audio file not found")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Failed to play sound: \(error)")
        }
    }
}
