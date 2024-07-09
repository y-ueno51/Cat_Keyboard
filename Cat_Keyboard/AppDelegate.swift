//
//  AppDelegate.swift
//  Cat_Keyboard
//
//  Created by 上野友綺 on 2024/07/09.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    var menuBarController: MenuBarController!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        menuBarController = MenuBarController()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}
