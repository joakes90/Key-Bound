//
//  KeyBindingControlable.swift
//  Key Bound
//
//  Created by Justin Oakes on 10/26/20.
//

import Cocoa
import Combine

protocol KeyBindingControlable {
    var bindings: [Binding] {get set}
}

class Binding: Hashable {
    let key: FunctionKey
    let userDefaults: UserDefaults?
    var mappedValue: MappedValue? {
        didSet {
            switch mappedValue {
            case .keyEvent(let number):
                userDefaults?.setValue(number, forKey: key.rawValue)
            case .appLaunch(let string):
                userDefaults?.setValue(string, forKey: key.rawValue)
            default:
                userDefaults?.setValue(nil, forKey: FunctionKey.f1.rawValue)
            }
            userDefaults?.synchronize()
        }
    }
    
    init(key: FunctionKey, userDefaults: UserDefaults?) {
        self.key = key
        self.userDefaults = userDefaults
        let value = userDefaults?.value(forKey: key.rawValue)
        if let value = value as? Int32 {
            self.mappedValue = .keyEvent(value)
        }
        if let value = value as? String {
            self.mappedValue = .appLaunch(value)
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

class KeyBindingController: KeyBindingControlable, ObservableObject {

    private var userDefaults: UserDefaults?
    static let shared = KeyBindingController(functionKeys: FunctionKey.allCases)
    @Published var bindings = [Binding]()
    
    init(functionKeys: [FunctionKey], userDefaults: UserDefaults? = UserDefaults.standard) {
        self.userDefaults = userDefaults
        functionKeys.forEach({ bindings.append(Binding(key: $0, userDefaults: userDefaults))})
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
    
    private func launchApplication(_ appName: String) {
        NSWorkspace.shared.launchApplication(appName)
    }
    
    private func performKeyCode(_ keyCode: Int32) {
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
    
    var value: MappedValue? {
        get {
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
            case .keyboardUp:
                return .keyEvent(NX_KEYTYPE_ILLUMINATION_UP)
            case .keyboardDown:
                return .keyEvent(NX_KEYTYPE_ILLUMINATION_DOWN)
            case .playPause:
                return .keyEvent(NX_KEYTYPE_PLAY)
            case .next:
                return .keyEvent(NX_KEYTYPE_NEXT)
            case .last:
                return .keyEvent(NX_KEYTYPE_PREVIOUS)
            case .eject:
                return .keyEvent(NX_KEYTYPE_EJECT)
            case .launchPad:
                return .appLaunch("Launchpad")
            case .missionControl:
                return .appLaunch("Mission Control")
            case .none:
                return nil
            }
        }
    }
}
