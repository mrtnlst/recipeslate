//
//  ListTableViewHeader.swift
//  Recipe Slate
//
//  Created by martin on 10.01.21.
//  Copyright © 2021 Martin List. All rights reserved.
//

import UIKit

class ListTableViewHeader: UIView {
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        return stackView
    }()
    lazy var sortButton: IconButton = {
        let button = IconButton()
        button.icon = UIImage(systemName: "arrow.up.arrow.down.circle")
        button.title = "Sort by"
        button.addTarget(self, selector: #selector(sortAction))
        return button
    }()
    lazy var filterButton: IconButton = {
        let button = IconButton()
        button.icon = UIImage(systemName: "line.horizontal.3.decrease.circle")
        button.title = "Filter"
        button.addTarget(self, selector: #selector(filterAction))
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Action
extension ListTableViewHeader {
    
    @objc func sortAction() {
        
    }
    
    @objc func filterAction() {
        
    }
}

// MARK: - Private
private extension ListTableViewHeader {
    
    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        stackView.addArrangedSubview(filterButton)
        stackView.addArrangedSubview(sortButton)
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
