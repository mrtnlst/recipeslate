//
//  IconButton.swift
//  Recipe Slate
//
//  Created by martin on 10.01.21.
//  Copyright © 2021 Martin List. All rights reserved.
//

import UIKit

/// A button view with an icon on the left side.
class IconButton: UIView {

    // MARK: - Properties
    lazy var button: UIButton = {
        var button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.setTitleColor(.white, for: .normal)
        button.contentEdgeInsets = .init(top: 0, left: 8, bottom: 0, right: 16)
        button.titleEdgeInsets = .init(top: 0, left: 8, bottom: 0, right: -8)
        return button
    }()
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }()
    
    // MARK: - Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public
extension IconButton {
    
    var icon: UIImage? {
        get { button.image(for: .normal) }
        set { button.setImage(newValue, for: .normal) }
    }
    
    var title: String? {
        get { button.title(for: .normal) }
        set { button.setTitle(newValue, for: .normal) }
    }
    
    func addTarget(_ target: Any?, selector: Selector) {
        button.addTarget(target, action: selector, for: .touchUpInside)
    }
}

// MARK: - Private
extension IconButton {
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        stackView.addArrangedSubview(button)
        configureConstraints()
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
