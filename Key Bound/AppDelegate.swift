//
//  AppDelegate.swift
//  Key Bound
//
//  Created by Justin Oakes on 10/21/20.
//

import Cocoa
import Combine
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow?
    @IBOutlet weak var systemItemMenu: NSMenu!
    @IBOutlet weak var actionMenu: NSMenu!

    // Action Menu Items
    @IBOutlet weak var f1MenuItem: NSMenuItem!
    @IBOutlet weak var f2MenuItem: NSMenuItem!
    @IBOutlet weak var f3MenuItem: NSMenuItem!
    @IBOutlet weak var f4MenuItem: NSMenuItem!
    @IBOutlet weak var f5MenuItem: NSMenuItem!
    @IBOutlet weak var f6MenuItem: NSMenuItem!
    @IBOutlet weak var f7MenuItem: NSMenuItem!
    @IBOutlet weak var f8MenuItem: NSMenuItem!
    @IBOutlet weak var f9MenuItem: NSMenuItem!
    @IBOutlet weak var f10MenuItem: NSMenuItem!
    @IBOutlet weak var f11MenuItem: NSMenuItem!
    @IBOutlet weak var f12MenuItem: NSMenuItem!
    
    
    var keyListner: KeyListner?
    var statusItem: NSStatusItem?
    let keyBindingController = KeyBindingController(functionKeys: FunctionKey.allCases)
    var bindingSub: AnyCancellable?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let settingsController = SettingsController(usingDefaults: UserDefaults.standard)
        bindingSub = keyBindingController.objectWillChange.sink(receiveValue: { [weak self] (_) in
            self?.labelActionMenuItems()
        })
        requestPermissions()
        labelActionMenuItems()
        if settingsController.showPrefsAtLaunch {
            createPrefsWindow()
        }
        if settingsController.showInMenu {
            createStatusItem()
        }
        if !settingsController.hasLaunched {
            disableAlertVolume()
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
    
    @IBAction func performAction(_ sender: NSMenuItem) {
        let itemIndex = sender.tag
        keyBindingController.bindings[itemIndex].mappedValue?.performAction()
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
    
    private func labelActionMenuItems() {
        for index in 0..<actionMenu.numberOfItems {
            let binding = keyBindingController.bindings[index]
            let menuItem = actionMenu.item(at: index)
            menuItem?.title = binding.mappedValue?.actionName ?? "None"
        }
    }

    private func createPrefsWindow() {
//        let preferencesView = PreferencesView(settingsController: SettingsController(usingDefaults: .standard))
//            .environmentObject(keyBindingController)
//            .frame(minWidth: 480.0, maxWidth: .infinity, minHeight: 600.0, maxHeight: .infinity)
//            .environmentObject(keyBindingController)
        let prefsViewController = PreferencesAppKitView(nibName: "PreferencesAppKitView", bundle: nil)
        window = NSWindow(contentRect: NSRect(x: 0, y: 0, width: 480.0, height: 500.0),
                          styleMask: [.titled, .closable, .miniaturizable, .resizable],
                          backing: .buffered,
                          defer: false)
        window?.isReleasedWhenClosed = false
        window?.center()
        window?.setFrameAutosaveName("Preferences")
        window?.contentViewController = prefsViewController
//        window?.contentView = NSHostingView(rootView: preferencesView)
        window?.title = "Preferences"
        window?.makeKeyAndOrderFront(self)
    }

    private func createStatusItem() {
        statusItem = NSStatusBar.system.statusItem(withLength: 32.0)
        statusItem?.button?.image = #imageLiteral(resourceName: "Status_Item")
        statusItem?.menu = systemItemMenu
    }

    private func regesterEvents() {
        keyListner = KeyListner(keybindingController: keyBindingController)
    }

    private func disableAlertVolume() {
        let alert = NSAlert()
        alert.messageText = "Disable Alert volume"
        alert.informativeText = "Some applications like Finder may beep when standard function key are typed, while they are open. It's suggested you make sure the Alert Volume slider is turned down in System Preferences to scilence these beeps."
        alert.addButton(withTitle: "Go to System Preferences")
        alert.addButton(withTitle: "Cancel")
        if let window = window {
            alert.beginSheetModal(for: window) { (response) in
                switch response {
                case .alertFirstButtonReturn:
                    let url = URL(fileURLWithPath: "/System/Library/PreferencePanes/Sound.prefPane")
                    NSWorkspace.shared.open(url)
                default:
                    return
                }
            }
        }
    }
}

