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
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "detail-unfavorite"), for: .normal)
        contentView.addSubview(button)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        title.textColor = .white
        title.textAlignment = .left
        title.numberOfLines = 1
        title.lineBreakMode = .byTruncatingTail
        contentView.addSubview(title)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            button.heightAnchor.constraint(equalToConstant: 30),
            button.widthAnchor.constraint(equalToConstant: 30),
            button.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }
    
    public func setFavoriteState(_ state: FavoriteState) {
        favoriteState = state
        button.setImage(UIImage(named: "detail-\(state.rawValue)"), for: .normal)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)
    }
}
