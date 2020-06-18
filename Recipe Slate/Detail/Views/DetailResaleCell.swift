//
//  DetailResaleCell.swift
//  Recipe Slate
//
//  Created by Martin List on 18.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

class DetailResaleCell: UITableViewCell {
    
    static let identifier = "Detail-Resale-Cell"
    public var resaleLabel = UILabel()
    private var stackView = UIStackView()
    private var item: Item!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
        NotificationCenter.default.addObserver(self, selector: #selector(updateResaleLabel),
                                               name: NSNotification.Name(rawValue: "set-resale"), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        backgroundColor = .backgroundBlue
        let selectedView = UIView()
        selectedView.backgroundColor = .tableViewCellSelectedColor
        selectedBackgroundView = selectedView
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        contentView.addSubview(stackView)
        
        resaleLabel.translatesAutoresizingMaskIntoConstraints = false
        resaleLabel.font = UIFont.preferredFont(forTextStyle: .body)
        resaleLabel.textColor = .secondaryTextColor
        resaleLabel.textAlignment = .left
        resaleLabel.numberOfLines = 1
        resaleLabel.lineBreakMode = .byTruncatingTail
        stackView.addArrangedSubview(resaleLabel)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
        ])
    }
    
    @objc func updateResaleLabel(_ notification: Notification) {
        guard let material = notification.object as? Material else { return }
        if let meal = item as? Meal {
            configureResaleLabel(ResaleHandler.resaleValue(for: meal, and: [material]))
        }
    }
    
    func setItem(_ item: Item) {
        self.item = item
        if let meal = item as? Meal {
            configureResaleLabel(ResaleHandler.resaleValue(for: meal, and: []))
        }
    }
    
    private func configureResaleLabel(_ text: String) {
        resaleLabel.text = text
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)
    }
}
