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
    let userDefaults = UserDefaults.standard

    var f1Value: MappedValue? {
        get {
            let value = userDefaults.value(forKey: FunctionKeys.f1.rawValue)
            return value as? MappedValue
        }
        set {
            userDefaults.setValue(newValue, forKey: FunctionKeys.f1.rawValue)
        }
    }
    var f2Value: MappedValue? {
        get {
            let value = userDefaults.value(forKey: FunctionKeys.f2.rawValue)
            return value as? MappedValue
        }
        set {
            userDefaults.setValue(newValue, forKey: FunctionKeys.f2.rawValue)
        }
    }
    var f3Value: MappedValue? {
        get {
            let value = userDefaults.value(forKey: FunctionKeys.f3.rawValue)
            return value as? MappedValue
        }
        set {
            userDefaults.setValue(newValue, forKey: FunctionKeys.f3.rawValue)
        }
    }
    var f4Value: MappedValue? {
        get {
            let value = userDefaults.value(forKey: FunctionKeys.f4.rawValue)
            return value as? MappedValue
        }
        set {
            userDefaults.setValue(newValue, forKey: FunctionKeys.f4.rawValue)
        }
    }
    var f5Value: MappedValue? {
        get {
            let value = userDefaults.value(forKey: FunctionKeys.f5.rawValue)
            return value as? MappedValue
        }
        set {
            userDefaults.setValue(newValue, forKey: FunctionKeys.f5.rawValue)
        }
    }
    var f6Value: MappedValue? {
        get {
            let value = userDefaults.value(forKey: FunctionKeys.f6.rawValue)
            return value as? MappedValue
        }
        set {
            userDefaults.setValue(newValue, forKey: FunctionKeys.f6.rawValue)
        }
    }
    var f7Value: MappedValue? {
        get {
            let value = userDefaults.value(forKey: FunctionKeys.f7.rawValue)
            return value as? MappedValue
        }
        set {
            userDefaults.setValue(newValue, forKey: FunctionKeys.f7.rawValue)
        }
    }
    var f8Value: MappedValue? {
        get {
            let value = userDefaults.value(forKey: FunctionKeys.f8.rawValue)
            return value as? MappedValue
        }
        set {
            userDefaults.setValue(newValue, forKey: FunctionKeys.f8.rawValue)
        }
    }
    var f9Value: MappedValue? {
        get {
            let value = userDefaults.value(forKey: FunctionKeys.f9.rawValue)
            return value as? MappedValue
        }
        set {
            userDefaults.setValue(newValue, forKey: FunctionKeys.f9.rawValue)
        }
    }
    var f10Value: MappedValue? {
        get {
            let value = userDefaults.value(forKey: FunctionKeys.f10.rawValue)
            return value as? MappedValue
        }
        set {
            userDefaults.setValue(newValue, forKey: FunctionKeys.f10.rawValue)
        }
    }
    var f11Value: MappedValue? {
        get {
            let value = userDefaults.value(forKey: FunctionKeys.f11.rawValue)
            return value as? MappedValue
        }
        set {
            userDefaults.setValue(newValue, forKey: FunctionKeys.f11.rawValue)
        }
    }
    var f12Value: MappedValue? {
        get {
            let value = userDefaults.value(forKey: FunctionKeys.f12.rawValue)
            return value as? MappedValue
        }
        set {
            userDefaults.setValue(newValue, forKey: FunctionKeys.f12.rawValue)
        }
    }
}

enum FunctionKeys: String, CaseIterable {
    case f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12
    
    var mappedValue: MappedValue? {
        switch self {
        case .f1:
            return KeyBindingController.shared.f1Value
        case .f2:
            return KeyBindingController.shared.f2Value
        case .f3:
            return KeyBindingController.shared.f3Value
        case .f4:
            return KeyBindingController.shared.f4Value
        case .f5:
            return KeyBindingController.shared.f5Value
        case .f6:
            return KeyBindingController.shared.f6Value
        case .f7:
            return KeyBindingController.shared.f7Value
        case .f8:
            return KeyBindingController.shared.f8Value
        case .f9:
            return KeyBindingController.shared.f9Value
        case .f10:
            return KeyBindingController.shared.f10Value
        case .f11:
            return KeyBindingController.shared.f11Value
        case .f12:
            return KeyBindingController.shared.f12Value
        }
    }
}

enum MappableAction: String, CaseIterable {
    case none = "None"
    case volumeUp = "Volume Up"
    case volumeDown = "Volume Dowm"
    case mute = "Mute"
    case brightnessUp = "Brightness Up"
    case brightnessDown = "Brightness Down"
    case keyboardBrightnessUp = "Keyboard Brightness Up"
    case keyboardBrightnessDown = "Keyboard Brightness Down"
    case pausePlay = "Play/Pause"
    case nextTrack = "Next Track"
    case previousTrack = "Previous Track"
    case missionControl = "Mission Control"
    case launchPad = "Launch Pad"
    case eject = "Eject"
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
    
    var action: MappableAction {
        switch self {
        case .keyEvent(NX_KEYTYPE_SOUND_UP):
            return .volumeUp
        case .keyEvent(NX_KEYTYPE_SOUND_DOWN):
            return .volumeDown
        case .keyEvent(NX_KEYTYPE_MUTE):
            return .mute
        case .keyEvent(NX_KEYTYPE_BRIGHTNESS_UP):
            return .brightnessUp
        case .keyEvent(NX_KEYTYPE_BRIGHTNESS_DOWN):
            return .brightnessDown
        case .keyEvent(NX_KEYTYPE_ILLUMINATION_UP):
            return .keyboardBrightnessUp
        case .keyEvent(NX_KEYTYPE_ILLUMINATION_DOWN):
            return .keyboardBrightnessDown
        case .keyEvent(NX_KEYTYPE_PLAY):
            return .pausePlay
        case .keyEvent(NX_KEYTYPE_NEXT):
            return .nextTrack
        case .keyEvent(NX_KEYTYPE_PREVIOUS):
            return .previousTrack
        case .keyEvent(NX_KEYTYPE_EJECT):
            return .eject
        case .appLaunch("Launchpad"):
            return .launchPad
        case .appLaunch("Mission Control"):
            return .missionControl
        default:
            return .none
        }
    }
}
