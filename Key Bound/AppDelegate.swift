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
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


    @IBAction func volUp(_ sender: Any) {
        let keyCode = NX_KEYTYPE_SOUND_UP
        let keyDownEvent = NSEvent.otherEvent(with: .systemDefined,
                                       location: NSPoint.zero,
                                       modifierFlags: NSEvent.ModifierFlags(rawValue: 0xa00),
                                       timestamp: 0,
                                       windowNumber: 0,
                                       context: nil,
                                       subtype: 8,
                                       data1: (Int((keyCode << 16 as Int32) | (0xa << 8 as Int32))),
                                       data2: -1)
        keyDownEvent?.cgEvent?.post(tap: .cghidEventTap)
        let keyUpEvent = NSEvent.otherEvent(with: .systemDefined,
                                            location: NSPoint.zero,
                                            modifierFlags: NSEvent.ModifierFlags(rawValue: 0xb00),
                                            timestamp: 0,
                                            windowNumber: 0,
                                            context: nil,
                                            subtype: 8,
                                            data1: (Int((keyCode << 16 as Int32) | (0xb << 8 as Int32))),
                                            data2: -1)
        keyUpEvent?.cgEvent?.post(tap: .cghidEventTap)
        
    }
    
    @IBAction func volDown(_ sender: Any) {
        let keyCode = NX_KEYTYPE_SOUND_DOWN
        let keyDownEvent = NSEvent.otherEvent(with: .systemDefined,
                                       location: NSPoint.zero,
                                       modifierFlags: NSEvent.ModifierFlags(rawValue: 0xa00),
                                       timestamp: 0,
                                       windowNumber: 0,
                                       context: nil,
                                       subtype: 8,
                                       data1: (Int((keyCode << 16 as Int32) | (0xa << 8 as Int32))),
                                       data2: -1)
        let keyUpEvent = NSEvent.otherEvent(with: .systemDefined,
                                            location: NSPoint.zero,
                                            modifierFlags: NSEvent.ModifierFlags(rawValue: 0xb00),
                                            timestamp: 0,
                                            windowNumber: 0,
                                            context: nil,
                                            subtype: 8,
                                            data1: (Int((keyCode << 16 as Int32) | (0xb << 8 as Int32))),
                                            data2: -1)
        keyDownEvent?.cgEvent?.post(tap: .cghidEventTap)
        keyUpEvent?.cgEvent?.post(tap: .cghidEventTap)
    }
    
    @IBAction func brightUp(_ sender: Any) {
        let keyCode = NX_KEYTYPE_BRIGHTNESS_UP
        let keyDownEvent = NSEvent.otherEvent(with: .systemDefined,
                                       location: NSPoint.zero,
                                       modifierFlags: NSEvent.ModifierFlags(rawValue: 0xa00),
                                       timestamp: 0,
                                       windowNumber: 0,
                                       context: nil,
                                       subtype: 8,
                                       data1: (Int((keyCode << 16 as Int32) | (0xa << 8 as Int32))),
                                       data2: -1)
        keyDownEvent?.cgEvent?.post(tap: .cghidEventTap)
        let keyUpEvent = NSEvent.otherEvent(with: .systemDefined,
                                            location: NSPoint.zero,
                                            modifierFlags: NSEvent.ModifierFlags(rawValue: 0xb00),
                                            timestamp: 0,
                                            windowNumber: 0,
                                            context: nil,
                                            subtype: 8,
                                            data1: (Int((keyCode << 16 as Int32) | (0xb << 8 as Int32))),
                                            data2: -1)
        keyUpEvent?.cgEvent?.post(tap: .cghidEventTap)
    }
    
    
    @IBAction func brightDown(_ sender: Any) {
        let keyCode = NX_KEYTYPE_BRIGHTNESS_DOWN
        let keyDownEvent = NSEvent.otherEvent(with: .systemDefined,
                                       location: NSPoint.zero,
                                       modifierFlags: NSEvent.ModifierFlags(rawValue: 0xa00),
                                       timestamp: 0,
                                       windowNumber: 0,
                                       context: nil,
                                       subtype: 8,
                                       data1: (Int((keyCode << 16 as Int32) | (0xa << 8 as Int32))),
                                       data2: -1)
        keyDownEvent?.cgEvent?.post(tap: .cghidEventTap)
        let keyUpEvent = NSEvent.otherEvent(with: .systemDefined,
                                            location: NSPoint.zero,
                                            modifierFlags: NSEvent.ModifierFlags(rawValue: 0xb00),
                                            timestamp: 0,
                                            windowNumber: 0,
                                            context: nil,
                                            subtype: 8,
                                            data1: (Int((keyCode << 16 as Int32) | (0xb << 8 as Int32))),
                                            data2: -1)
        keyUpEvent?.cgEvent?.post(tap: .cghidEventTap)
    }
    
    @IBAction func expose(_ sender: Any) {
        NSWorkspace.shared.launchApplication("Mission Control")
    }
    
    @IBAction func launchControl(_ sender: Any) {
        NSWorkspace.shared.launchApplication("Launchpad")
    }
    
    
}

