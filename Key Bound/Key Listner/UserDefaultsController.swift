//
//  UserDefaultsController.swift
//  Key Bound
//
//  Created by Justin Oakes on 10/26/20.
//

import Cocoa
import Combine


class KeyBindingController: ObservableObject {
    
    static let shared = KeyBindingController()

    var f1Value: MappedValue?
    var f2Value: MappedValue?
    var f3Value: MappedValue?
    var f4Value: MappedValue?
    var f5Value: MappedValue?
    var f6Value: MappedValue?
    var f7Value: MappedValue?
    var f8Value: MappedValue?
    var f9Value: MappedValue?
    var f10Value: MappedValue?
    var f11Value: MappedValue?
    var f12Value: MappedValue?
}

enum MappedValue {
    case keyEvent(Int32)
    case appLaunch(String)
    
    func performAction() {
        switch self {
        case .keyEvent( let keyCode):
            performKeyCode(keyCode)
        case .appLaunch(let appName):
            launchApplication(appName)
        }
    }
    
    func launchApplication(_ appName: String) {
        NSWorkspace.shared.launchApplication(appName)
    }
    
    func performKeyCode(_ keyCode: Int32) {
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
}
