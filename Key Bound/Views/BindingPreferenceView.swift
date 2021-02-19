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
        let stackView = NSStackView()
        stackView.orientation = .horizontal
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        
        let testLabel = NSTextField(labelWithString: "Hello")
        
        stackView.addArrangedSubview(testLabel)
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
