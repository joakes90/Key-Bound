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
        let settingsController = SettingsController()
        requestPermissions()
        // TODO: Make sure this is only fired when the open preferences at launch preference is enabled
        createPrefsWindow()
        if settingsController.showInMenu {
            createStatusItem()
        }
        regesterEvents()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
        presentPreferences(self)
        return true
    }
    
    @IBAction func presentPreferences(_ sender: Any) {
        if window != nil {
            window?.makeKeyAndOrderFront(nil)
        } else {
            createPrefsWindow()
        }
    }
    
    func toggleMenuVisability(isOn: Bool) {
        if isOn {
            createStatusItem()
        } else {
            if let statusItem = statusItem {
                NSStatusBar.system.removeStatusItem(statusItem)
            }
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

    private func regesterEvents() {
        keyListner = KeyListner(keybindingController: KeyBindingController.shared)
    }
}

