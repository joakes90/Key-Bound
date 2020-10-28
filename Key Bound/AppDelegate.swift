//
//  AppDelegate.swift
//  Key Bound
//
//  Created by Justin Oakes on 10/21/20.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet var window: NSWindow!
    var keyListner: KeyListner?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        requestPermissions()
        // TODO: Make sure this is only fired when the open preferences at launch preference is enabled
        createPrefsWindow()
        regesterEvents()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    private func requestPermissions() {
        let options: NSDictionary = [kAXTrustedCheckOptionPrompt.takeUnretainedValue() as String : true]
        AXIsProcessTrustedWithOptions(options)
        
    }
    
    private func createPrefsWindow() {
        // TODO: This should no longer be a thing once the piblishers are up and running
        let preferencesView = PreferencesView()
            .frame(minWidth: 480.0, maxWidth: .infinity, minHeight: 600.0, maxHeight: .infinity)
            .environmentObject(KeyBindingController.shared)
        window = NSWindow(contentRect: NSRect(x: 0, y: 0, width: 480.0, height: 500.0),
                          styleMask: [.titled, .closable, .miniaturizable, .resizable],
                          backing: .buffered,
                          defer: false)
        window.center()
        window.setFrameAutosaveName("Preferences")
        window.contentView = NSHostingView(rootView: preferencesView)
        window.title = "Preferences"
        window.makeKeyAndOrderFront(self)
    }
    
    // TODO: Break this out to be handled else where
    private func regesterEvents() {
        keyListner = KeyListner(keybindingController: KeyBindingController.shared)
    }
}

