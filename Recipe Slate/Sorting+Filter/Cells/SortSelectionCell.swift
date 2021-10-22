//
//  SortSelectionCell.swift
//  Recipe Slate
//
//  Created by martin on 10.01.21.
//  Copyright © 2021 Martin List. All rights reserved.
//

import UIKit

class SortSelectionCell: UITableViewCell {

    static let identifier = "sort-selection-cell"
    
    // MARK: - Properties
    lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .equalSpacing
        return stackView
    }()
    lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        return stackView
    }()
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    lazy var selectionIcon: UIImageView = {
        let icon = UIImageView(image: UIImage(systemName: "circle"))
        icon.tintColor = .white
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.contentMode = .scaleAspectFit
        return icon
    }()
    lazy var typeIcon: UIImageView = {
        let icon = UIImageView()
        icon.tintColor = .secondaryTextColor
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.contentMode = .scaleAspectFit
        icon.widthAnchor.constraint(equalToConstant: 30).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return icon
    }()
    
    // MARK: - Life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public
extension SortSelectionCell {
    
    var title: String? {
        get { label.text }
        set { label.text = newValue }
    }
    
    var icon: UIImage? {
        get { typeIcon.image }
        set { typeIcon.image = newValue }
    }
    
    var isCurrentlySelected: Bool {
        get { selectionIcon.image?.pngData() ==  UIImage(systemName: "checkmark.circle.fill")?.pngData() }
    }
    
    func setSelection(_ isSelected: Bool) {
        if isSelected {
            selectionIcon.image = UIImage(systemName: "checkmark.circle.fill")
        } else {
            selectionIcon.image = UIImage(systemName: "circle")
        }
    }
}

// MARK: - Private
extension SortSelectionCell {
    
    private func configureView() {
        backgroundColor = .defaultBackground
        let selectedView = UIView()
        selectedView.backgroundColor = .tableViewCellSelectedColor
        selectedBackgroundView = selectedView
        
        addSubview(contentStackView)
        
        horizontalStackView.addArrangedSubview(typeIcon)
        horizontalStackView.addArrangedSubview(label)
        contentStackView.addArrangedSubview(horizontalStackView)
        contentStackView.addArrangedSubview(selectionIcon)
        configureConstraints()
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            contentStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
}
