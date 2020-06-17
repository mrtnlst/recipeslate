//
//  DetailTitleCell.swift
//  Recipe Slate
//
//  Created by Martin List on 13.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

enum FavoriteState: String {
    case favorite = "favorite"
    case none = "unfavorite"
}

class DetailTitleCell: UITableViewCell {

    static let identifier = "Detail-Title-Cell"
    public var button = UIButton(type: .custom)
    public var title = UILabel()
    public var favoriteState: FavoriteState = .none
    private var stackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
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
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.preferredFont(forTextStyle: .body)
        title.textColor = .secondaryTextColor
        title.textAlignment = .left
        title.numberOfLines = 1
        title.lineBreakMode = .byTruncatingTail
        stackView.addArrangedSubview(title)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "detail-unfavorite"), for: .normal)
        stackView.addArrangedSubview(button)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            button.heightAnchor.constraint(equalToConstant: 25),
            button.widthAnchor.constraint(equalToConstant: 25),
        ])
    }
    
    public func setFavoriteState(_ state: FavoriteState) {
        favoriteState = state
        button.setImage(UIImage(named: "detail-\(state.rawValue)"), for: .normal)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        setFavoriteState(.none)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)
    }
}
