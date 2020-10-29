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

    var window: NSWindow?
    @IBOutlet weak var systemItemMenu: NSMenu!
    
    var keyListner: KeyListner?
    var statusItem: NSStatusItem?
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        requestPermissions()
        // TODO: Make sure this is only fired when the open preferences at launch preference is enabled
        createPrefsWindow()
        // TODO: Make sure this is only displayed show in menubar is enabled
        createStatusItem()
        regesterEvents()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    @IBAction func presentPreferences(_ sender: Any) {
        if window != nil {
            window?.makeKeyAndOrderFront(nil)
        } else {
            createPrefsWindow()
        }
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
        window?.isReleasedWhenClosed = false
        window?.center()
        window?.setFrameAutosaveName("Preferences")
        window?.contentView = NSHostingView(rootView: preferencesView)
        window?.title = "Preferences"
        window?.makeKeyAndOrderFront(self)
    }

    private func createStatusItem() {
        statusItem = NSStatusBar.system.statusItem(withLength: 32.0)
        statusItem?.button?.image = #imageLiteral(resourceName: "Status_Item")
        statusItem?.menu = systemItemMenu
    }

    // TODO: Break this out to be handled else where
    private func regesterEvents() {
        keyListner = KeyListner(keybindingController: KeyBindingController.shared)
    }
}

