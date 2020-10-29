//
//  SettingsController.swift
//  Key Bound
//
//  Created by Justin Oakes on 10/29/20.
//

import Cocoa
import Combine
import Foundation

class SettingsController: ObservableObject {
    private let userDefaults = UserDefaults.standard

    @Published var showInMenu: Bool {
        didSet {
            userDefaults.setValue(showInMenu, forKey: UserDefaults.showMenuKey)
            (NSApplication.shared.delegate as? AppDelegate)?.toggleMenuVisability(isOn: showInMenu)
        }
    }
    
    init() {
        let showInMenu: Bool = userDefaults.value(forKey: UserDefaults.showMenuKey) as? Bool ?? true
        self.showInMenu = showInMenu
    }
}

extension UserDefaults {
    static let showMenuKey = "showMenu"
}
