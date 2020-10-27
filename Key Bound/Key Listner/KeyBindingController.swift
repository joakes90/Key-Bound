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

    func setAction(boundAction: MappableAction, for key: FunctionKey) {
        let value = boundAction.value
        
        switch key {
        case .f1:
            f1Value = value
        case .f2:
            f2Value = value
        case .f3:
            f3Value = value
        case .f4:
            f4Value = value
        case .f5:
            f5Value = value
        case .f6:
            f6Value = value
        case .f7:
            f7Value = value
        case .f8:
            f8Value = value
        case .f9:
            f9Value = value
        case .f10:
            f10Value = value
        case .f11:
            f11Value = value
        case .f12:
            f12Value = value
        }
    }
    
    var f1Value: MappedValue? {
        get {
            let value = userDefaults.value(forKey: FunctionKey.f1.rawValue)
            if let value = value as? Int32 {
                return .keyEvent(value)
            }
            if let value = value as? String {
                return .appLaunch(value)
            }
            return .none
        }
        set {
            switch newValue {
            case .keyEvent(let number):
                userDefaults.setValue(number, forKey: FunctionKey.f1.rawValue)
            case .appLaunch(let string):
                userDefaults.setValue(string, forKey: FunctionKey.f1.rawValue)
            default:
                userDefaults.setValue(nil, forKey: FunctionKey.f1.rawValue)
            }
            userDefaults.synchronize()
        }
    }
    var f2Value: MappedValue? {
        get {
            let value = userDefaults.value(forKey: FunctionKey.f2.rawValue)
            if let value = value as? Int32 {
                return .keyEvent(value)
            }
            if let value = value as? String {
                return .appLaunch(value)
            }
            return .none
        }
        set {
            switch newValue {
            case .keyEvent(let number):
                userDefaults.setValue(number, forKey: FunctionKey.f2.rawValue)
            case .appLaunch(let string):
                userDefaults.setValue(string, forKey: FunctionKey.f2.rawValue)
            default:
                userDefaults.setValue(nil, forKey: FunctionKey.f2.rawValue)
            }
            userDefaults.synchronize()
        }
    }
    var f3Value: MappedValue? {
        get {
            let value = userDefaults.value(forKey: FunctionKey.f3.rawValue)
            if let value = value as? Int32 {
                return .keyEvent(value)
            }
            if let value = value as? String {
                return .appLaunch(value)
            }
            return .none
        }
        set {
            switch newValue {
            case .keyEvent(let number):
                userDefaults.setValue(number, forKey: FunctionKey.f3.rawValue)
            case .appLaunch(let string):
                userDefaults.setValue(string, forKey: FunctionKey.f3.rawValue)
            default:
                userDefaults.setValue(nil, forKey: FunctionKey.f3.rawValue)
            }
            userDefaults.synchronize()
        }
    }
    var f4Value: MappedValue? {
        get {
            let value = userDefaults.value(forKey: FunctionKey.f4.rawValue)
            if let value = value as? Int32 {
                return .keyEvent(value)
            }
            if let value = value as? String {
                return .appLaunch(value)
            }
            return .none
        }
        set {
            switch newValue {
            case .keyEvent(let number):
                userDefaults.setValue(number, forKey: FunctionKey.f4.rawValue)
            case .appLaunch(let string):
                userDefaults.setValue(string, forKey: FunctionKey.f4.rawValue)
            default:
                userDefaults.setValue(nil, forKey: FunctionKey.f4.rawValue)
            }
            userDefaults.synchronize()
        }
    }
    var f5Value: MappedValue? {
        get {
            let value = userDefaults.value(forKey: FunctionKey.f5.rawValue)
            if let value = value as? Int32 {
                return .keyEvent(value)
            }
            if let value = value as? String {
                return .appLaunch(value)
            }
            return .none
        }
        set {
            switch newValue {
            case .keyEvent(let number):
                userDefaults.setValue(number, forKey: FunctionKey.f5.rawValue)
            case .appLaunch(let string):
                userDefaults.setValue(string, forKey: FunctionKey.f5.rawValue)
            default:
                userDefaults.setValue(nil, forKey: FunctionKey.f5.rawValue)
            }
            userDefaults.synchronize()
        }
    }
    var f6Value: MappedValue? {
        get {
            let value = userDefaults.value(forKey: FunctionKey.f6.rawValue)
            if let value = value as? Int32 {
                return .keyEvent(value)
            }
            if let value = value as? String {
                return .appLaunch(value)
            }
            return .none
        }
        set {
            switch newValue {
            case .keyEvent(let number):
                userDefaults.setValue(number, forKey: FunctionKey.f6.rawValue)
            case .appLaunch(let string):
                userDefaults.setValue(string, forKey: FunctionKey.f6.rawValue)
            default:
                userDefaults.setValue(nil, forKey: FunctionKey.f6.rawValue)
            }
            userDefaults.synchronize()
        }
    }
    var f7Value: MappedValue? {
        get {
            let value = userDefaults.value(forKey: FunctionKey.f7.rawValue)
            if let value = value as? Int32 {
                return .keyEvent(value)
            }
            if let value = value as? String {
                return .appLaunch(value)
            }
            return .none
        }
        set {
            switch newValue {
            case .keyEvent(let number):
                userDefaults.setValue(number, forKey: FunctionKey.f7.rawValue)
            case .appLaunch(let string):
                userDefaults.setValue(string, forKey: FunctionKey.f7.rawValue)
            default:
                userDefaults.setValue(nil, forKey: FunctionKey.f7.rawValue)
            }
            userDefaults.synchronize()
        }
    }
    var f8Value: MappedValue? {
        get {
            let value = userDefaults.value(forKey: FunctionKey.f8.rawValue)
            if let value = value as? Int32 {
                return .keyEvent(value)
            }
            if let value = value as? String {
                return .appLaunch(value)
            }
            return .none
        }
        set {
            switch newValue {
            case .keyEvent(let number):
                userDefaults.setValue(number, forKey: FunctionKey.f8.rawValue)
            case .appLaunch(let string):
                userDefaults.setValue(string, forKey: FunctionKey.f8.rawValue)
            default:
                userDefaults.setValue(nil, forKey: FunctionKey.f8.rawValue)
            }
            userDefaults.synchronize()
        }
    }
    var f9Value: MappedValue? {
        get {
            let value = userDefaults.value(forKey: FunctionKey.f9.rawValue)
            if let value = value as? Int32 {
                return .keyEvent(value)
            }
            if let value = value as? String {
                return .appLaunch(value)
            }
            return .none
        }
        set {
            switch newValue {
            case .keyEvent(let number):
                userDefaults.setValue(number, forKey: FunctionKey.f9.rawValue)
            case .appLaunch(let string):
                userDefaults.setValue(string, forKey: FunctionKey.f9.rawValue)
            default:
                userDefaults.setValue(nil, forKey: FunctionKey.f9.rawValue)
            }
            userDefaults.synchronize()
        }
    }
    var f10Value: MappedValue? {
        get {
            let value = userDefaults.value(forKey: FunctionKey.f10.rawValue)
            if let value = value as? Int32 {
                return .keyEvent(value)
            }
            if let value = value as? String {
                return .appLaunch(value)
            }
            return .none
        }
        set {
            switch newValue {
            case .keyEvent(let number):
                userDefaults.setValue(number, forKey: FunctionKey.f10.rawValue)
            case .appLaunch(let string):
                userDefaults.setValue(string, forKey: FunctionKey.f10.rawValue)
            default:
                userDefaults.setValue(nil, forKey: FunctionKey.f10.rawValue)
            }
            userDefaults.synchronize()
        }
    }
    var f11Value: MappedValue? {
        get {
            let value = userDefaults.value(forKey: FunctionKey.f11.rawValue)
            if let value = value as? Int32 {
                return .keyEvent(value)
            }
            if let value = value as? String {
                return .appLaunch(value)
            }
            return .none
        }
        set {
            switch newValue {
            case .keyEvent(let number):
                userDefaults.setValue(number, forKey: FunctionKey.f11.rawValue)
            case .appLaunch(let string):
                userDefaults.setValue(string, forKey: FunctionKey.f11.rawValue)
            default:
                userDefaults.setValue(nil, forKey: FunctionKey.f11.rawValue)
            }
            userDefaults.synchronize()
        }
    }
    var f12Value: MappedValue? {
        get {
            let value = userDefaults.value(forKey: FunctionKey.f12.rawValue)
            if let value = value as? Int32 {
                return .keyEvent(value)
            }
            if let value = value as? String {
                return .appLaunch(value)
            }
            return .none
        }
        set {
            switch newValue {
            case .keyEvent(let number):
                userDefaults.setValue(number, forKey: FunctionKey.f12.rawValue)
            case .appLaunch(let string):
                userDefaults.setValue(string, forKey: FunctionKey.f12.rawValue)
            default:
                userDefaults.setValue(nil, forKey: FunctionKey.f12.rawValue)
            }
            userDefaults.synchronize()
        }
    }
}

enum FunctionKey: String, CaseIterable {
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
    case volumeDown = "Volume Down"
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
    
    var value: MappedValue? {
        switch self {
        case .volumeUp:
            return .keyEvent(NX_KEYTYPE_SOUND_UP)
        case .volumeDown:
            return .keyEvent(NX_KEYTYPE_SOUND_DOWN)
        case .mute:
            return .keyEvent(NX_KEYTYPE_MUTE)
        case .brightnessUp:
            return .keyEvent(NX_KEYTYPE_BRIGHTNESS_UP)
        case .brightnessDown:
            return .keyEvent(NX_KEYTYPE_BRIGHTNESS_DOWN)
        case .keyboardBrightnessUp:
            return .keyEvent(NX_KEYTYPE_ILLUMINATION_UP)
        case .keyboardBrightnessDown:
            return .keyEvent(NX_KEYTYPE_ILLUMINATION_DOWN)
        case .pausePlay:
            return .keyEvent(NX_KEYTYPE_PLAY)
        case .nextTrack:
            return .keyEvent(NX_KEYTYPE_NEXT)
        case .previousTrack:
            return .keyEvent(NX_KEYTYPE_PREVIOUS)
        case .missionControl:
            return .appLaunch("Mission Control")
        case .launchPad:
            return .appLaunch("Launchpad")
        case .eject:
            return .keyEvent(NX_KEYTYPE_EJECT)
        case .none:
            return nil
        }
    }
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
