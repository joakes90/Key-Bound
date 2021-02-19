//
//  PreferencesAppKitview.swift
//  Key Bound
//
//  Created by Justin Oakes on 2/19/21.
//

import Cocoa

class PreferencesAppKitView: NSViewController {

    @IBOutlet weak var keyBindingStackView: NSStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        createBindingRows()
    }
    
    private func createBindingRows() {
        KeyBindingController.shared.bindings.forEach { (binding) in
            let bindingView = BindingPreferenceView(with: binding, frame: NSRect(x: 0.0, y: 0.0, width: view.frame.width, height: 25.0))
            keyBindingStackView.addArrangedSubview(bindingView)
            bindingView.heightAnchor.constraint(equalToConstant: 25.0).isActive = true
            bindingView.widthAnchor.constraint(equalTo: keyBindingStackView.widthAnchor).isActive = true
        }
    }
}
