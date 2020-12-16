//
//  SettingsController.swift
//  Key Bound
//
//  Created by Justin Oakes on 10/29/20.
//

import Cocoa
import Combine
import Foundation

protocol SettingsControllable: ObservableObject {
    var showInMenu: Bool { get set }
    var showPrefsAtLaunch: Bool { get set }
    var showDockIcon: Bool { get set }
}

class SettingsController: SettingsControllable {
    private let userDefaults: UserDefaults?

    @Published var showInMenu: Bool {
        didSet {
            userDefaults?.setValue(showInMenu, forKey: UserDefaults.showMenuKey)
            (NSApplication.shared.delegate as? AppDelegate)?.toggleMenuVisability(isOn: showInMenu)
        }
    }

    @Published var showPrefsAtLaunch: Bool {
        didSet {
            userDefaults?.setValue(showPrefsAtLaunch, forKey: UserDefaults.showPrefsKey)
        }
    }

    @Published var showDockIcon: Bool {
        didSet {
            userDefaults?.setValue(showDockIcon, forKey: UserDefaults.showDockIconKey)
            let activationPolicy: NSApplication.ActivationPolicy = showDockIcon ? .regular : .accessory
            NSApp.setActivationPolicy(activationPolicy)
        }
    }

    var hasLaunched: Bool {
        get {
            let launched: Bool = userDefaults?.value(forKey: UserDefaults.hasLaunchedKey) as? Bool ?? false
            self.hasLaunched = true
            return launched
        }
        set {
            userDefaults?.setValue(newValue, forKey: UserDefaults.hasLaunchedKey)
        }
    }

    init(usingDefaults userDefaults: UserDefaults?) {
        self.userDefaults = userDefaults
        let showInMenu: Bool = userDefaults?.value(forKey: UserDefaults.showMenuKey) as? Bool ?? true
        let showPrefs: Bool = userDefaults?.value(forKey: UserDefaults.showPrefsKey) as? Bool ?? true
        let showDock: Bool = userDefaults?.value(forKey: UserDefaults.showDockIconKey) as? Bool ?? true
        self.showInMenu = showInMenu
        self.showPrefsAtLaunch = showPrefs
        self.showDockIcon = showDock
    }
}

extension UserDefaults {
    static let showMenuKey = "showMenu"
    static let showPrefsKey = "showPrefs"
    static let showDockIconKey = "showDock"
    static let hasLaunchedKey = "hasLaunched"
}
