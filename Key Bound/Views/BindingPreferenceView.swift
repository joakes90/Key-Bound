//
//  BindingPreferenceView.swift
//  Key Bound
//
//  Created by Justin Oakes on 2/19/21.
//

import Cocoa

class BindingPreferenceView: NSView {

    private let binding: Binding
    init(with binding: Binding, frame: NSRect) {
        self.binding = binding
        super.init(frame: frame)
        initCommon()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initCommon() {
        translatesAutoresizingMaskIntoConstraints = false
        let testLabel = NSTextField(labelWithString: "Hello")
        let stackView = NSStackView(views: [testLabel])
        stackView.orientation = .horizontal
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(equalTo: heightAnchor),
            stackView.widthAnchor.constraint(equalTo: widthAnchor),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
