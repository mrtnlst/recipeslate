//
//  UITableView.swift
//  Recipe Slate
//
//  Created by Martin List on 16.07.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

extension UITableView {
    func setTableHeaderView(headerView: UIView) {
        let auxiliaryView = UIView()
        auxiliaryView.translatesAutoresizingMaskIntoConstraints = false
        auxiliaryView.addSubview(headerView)
        auxiliaryView.backgroundColor = .tableHeaderBackgroundColor
        
        self.tableHeaderView = auxiliaryView
        
        NSLayoutConstraint.activate([
            auxiliaryView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            auxiliaryView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            auxiliaryView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            auxiliaryView.heightAnchor.constraint(equalToConstant: 46),
            auxiliaryView.topAnchor.constraint(equalTo: self.topAnchor),
            
            headerView.centerXAnchor.constraint(equalTo: auxiliaryView.centerXAnchor),
            headerView.leadingAnchor.constraint(equalTo: auxiliaryView.leadingAnchor, constant: 15),
            headerView.trailingAnchor.constraint(equalTo: auxiliaryView.trailingAnchor, constant: -15),
            headerView.topAnchor.constraint(equalTo: auxiliaryView.topAnchor, constant: 5),
            headerView.bottomAnchor.constraint(equalTo: auxiliaryView.bottomAnchor, constant: -6),
        ])
    }
    
    func shouldUpdateHeaderViewFrame() -> Bool {
        guard let headerView = self.tableHeaderView else { return false }
        let oldSize = headerView.bounds.size
        headerView.layoutIfNeeded()
        let newSize = headerView.bounds.size
        return oldSize != newSize
    }
    
    func updateHeaderView() {
        // Reflect the latest size in tableHeaderView
        if self.shouldUpdateHeaderViewFrame() {
            // This is where table view's content (tableHeaderView, section headers, cells)
            // frames are updated to account for the new table header size.
            self.beginUpdates()
            self.endUpdates()
        }
    }
}
