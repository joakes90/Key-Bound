//
//  UserDefaultsController.swift
//  Key Bound
//
//  Created by Justin Oakes on 10/26/20.
//

import Cocoa
import Combine
import SwiftUI

class Binding: Hashable {
    let key: FunctionKey
    var mapedValue: MappedValue? {
        didSet {
            switch mapedValue {
            case .keyEvent(let number):
                UserDefaults.standard.setValue(number, forKey: key.rawValue)
            case .appLaunch(let string):
                UserDefaults.standard.setValue(string, forKey: key.rawValue)
            default:
                UserDefaults.standard.setValue(nil, forKey: FunctionKey.f1.rawValue)
            }
            UserDefaults.standard.synchronize()
        }
    }
    
    init(key: FunctionKey) {
        self.key = key
        let value = UserDefaults.standard.value(forKey: key.rawValue)
        if let value = value as? Int32 {
            self.mapedValue = .keyEvent(value)
        }
        if let value = value as? String {
            self.mapedValue = .appLaunch(value)
        }
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(key)
    }
    
    var hashValue: Int {
        get {
            return key.hashValue
        }
    }
    
    static func == (lhs: Binding, rhs: Binding) -> Bool {
        return lhs.key == rhs.key
    }
}

class KeyBindingController: ObservableObject {
    
    static let shared = KeyBindingController()
    @Published var bindings = [Binding]()
    
    init() {
        FunctionKey.allCases.forEach({ bindings.append(Binding(key: $0))})
    }
}

enum FunctionKey: String, CaseIterable {
    case f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12
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
    
    var actionName: String {
        switch self {
        case .keyEvent(NX_KEYTYPE_SOUND_UP):
            return MappableActionNames.volumeUp.rawValue
        case .keyEvent(NX_KEYTYPE_SOUND_DOWN):
            return MappableActionNames.volumeDown.rawValue
        case .keyEvent(NX_KEYTYPE_MUTE):
            return MappableActionNames.mute.rawValue
        case .keyEvent(NX_KEYTYPE_BRIGHTNESS_UP):
            return MappableActionNames.brightnessUp.rawValue
        case .keyEvent(NX_KEYTYPE_BRIGHTNESS_DOWN):
            return MappableActionNames.brightnessDown.rawValue
        case .keyEvent(NX_KEYTYPE_ILLUMINATION_UP):
            return MappableActionNames.keyboardUp.rawValue
        case .keyEvent(NX_KEYTYPE_ILLUMINATION_DOWN):
            return MappableActionNames.keyboardDown.rawValue
        case .keyEvent(NX_KEYTYPE_PLAY):
            return MappableActionNames.playPause.rawValue
        case .keyEvent(NX_KEYTYPE_NEXT):
            return MappableActionNames.next.rawValue
        case .keyEvent(NX_KEYTYPE_PREVIOUS):
            return MappableActionNames.last.rawValue
        case .keyEvent(NX_KEYTYPE_EJECT):
            return MappableActionNames.eject.rawValue
        case .appLaunch("Launchpad"):
            return MappableActionNames.launchPad.rawValue
        case .appLaunch("Mission Control"):
            return MappableActionNames.missionControl.rawValue
        default:
            return MappableActionNames.none.rawValue
        }
    }
}

enum MappableActionNames: String, CaseIterable {
    case volumeUp = "Volume Up"
    case volumeDown = "Volume Down"
    case mute = "Mute"
    case brightnessUp = "Brightness Up"
    case brightnessDown = "Brightness Down"
    case keyboardUp = "Keyboard Brightness Up"
    case keyboardDown = "Keyboard Brightness Down"
    case playPause = "Play/Pause"
    case next = "Next Track"
    case last = "Previous Track"
    case eject = "Eject"
    case launchPad = "Launch Pad"
    case missionControl = "Mission Control"
    case none = "None"
}
