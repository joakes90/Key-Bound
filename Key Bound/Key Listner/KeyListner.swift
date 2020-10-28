//
//  KeyListner.swift
//  Key Bound
//
//  Created by Justin Oakes on 10/28/20.
//

import Cocoa

class KeyListner {
    
    private var bindings: [Binding]

    init(keybindingController: KeyBindingControlable) {
        bindings = keybindingController.bindings
        NSEvent.addGlobalMonitorForEvents(matching: .keyDown) { [weak self] (event) in
            switch event.keyCode {
            case KeyCode.f1:
                let binding = self?.bindings.first(where: { $0.key == .f1 })
                binding?.mappedValue?.performAction()
            case KeyCode.f2:
                let binding = self?.bindings.first(where: { $0.key == .f2 })
                binding?.mappedValue?.performAction()
            case KeyCode.f3:
                let binding = self?.bindings.first(where: { $0.key == .f3 })
                binding?.mappedValue?.performAction()
            case KeyCode.f4:
                let binding = self?.bindings.first(where: { $0.key == .f4 })
                binding?.mappedValue?.performAction()
            case KeyCode.f5:
                let binding = self?.bindings.first(where: { $0.key == .f5 })
                binding?.mappedValue?.performAction()
            case KeyCode.f6:
                let binding = self?.bindings.first(where: { $0.key == .f6 })
                binding?.mappedValue?.performAction()
            case KeyCode.f7:
                let binding = self?.bindings.first(where: { $0.key == .f7 })
                binding?.mappedValue?.performAction()
            case KeyCode.f8:
                let binding = self?.bindings.first(where: { $0.key == .f8 })
                binding?.mappedValue?.performAction()
            case KeyCode.f9:
                let binding = self?.bindings.first(where: { $0.key == .f9 })
                binding?.mappedValue?.performAction()
            case KeyCode.f10:
                let binding = self?.bindings.first(where: { $0.key == .f10 })
                binding?.mappedValue?.performAction()
            case KeyCode.f11:
                let binding = self?.bindings.first(where: { $0.key == .f11 })
                binding?.mappedValue?.performAction()
            case KeyCode.f12:
                let binding = self?.bindings.first(where: { $0.key == .f12 })
                binding?.mappedValue?.performAction()
            default:
                return
            }
        }
        //        NSEvent.addGlobalMonitorForEvents(matching: .keyDown) { (event) in
        //            if event.keyCode == 101 {
        //                print("f9")
        //            } else if event.keyCode == 109 {
        //                print("f10")
        //            }
        //        }
    }
}
