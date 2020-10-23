//
//  AppDelegate.swift
//  Key Bound
//
//  Created by Justin Oakes on 10/21/20.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        requestPermissions()
        regesterEvents()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    private func requestPermissions() {
        let options: NSDictionary = [kAXTrustedCheckOptionPrompt.takeUnretainedValue() as String : true]
        AXIsProcessTrustedWithOptions(options)
        
    }
    
    private func regesterEvents() {
        NSEvent.addGlobalMonitorForEvents(matching: .keyDown) { (event) in
            if event.keyCode == 101 {
                print("f9")
            } else if event.keyCode == 109 {
                print("f10")
            }
        }
    }
}

