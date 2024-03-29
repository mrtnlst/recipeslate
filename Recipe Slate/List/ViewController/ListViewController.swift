//
//  ListViewController.swift
//  Recipe Slate
//
//  Created by martin on 12.04.17.
//  Copyright © 2017 Martin List. All rights reserved.
//

import UIKit
import SwiftUI

class ListViewController: UIViewController {
    
    let searchController = SearchController()
    var tableView = ListTableView()
    var dataSource: DataSource
    var segmentedControl = SegmentedControl()
    var filter: Material?
    lazy var aboutViewController: UIHostingController = UIHostingController(rootView: AboutView(store: AboutStore()))
    
    init(dataSource: DataSource, filter: Material? = nil) {
        self.dataSource = dataSource
        self.filter = filter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        setupSearch()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.updateHeaderView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: - User Interface
extension ListViewController {
    
    func setupViews() {        
        dataSource.createSections(by: .alphabet)
        tableView.delegate = self
        tableView.dataSource = dataSource
        tableView.setTableHeaderView(headerView: segmentedControl)
        segmentedControl.addTarget(self, action: #selector(refreshTable) , for: UIControl.Event.valueChanged)
        view.addSubview(tableView)
        
        let barButton = UIBarButtonItem.barButton(with: UIImage(named: "triforce"), target: self, selector: #selector(openAbout))
        navigationItem.rightBarButtonItem = barButton
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])
    }
}
 
// MARK: - Actions
extension ListViewController {
    
    @objc func openAbout() {
        let barButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissAbout))
        aboutViewController.navigationItem.rightBarButtonItem = barButton
        navigationController?.present(
            NavigationController(rootViewController: aboutViewController),
            animated: true,
            completion: nil
        )
    }
    
    @objc func dismissAbout() {
        aboutViewController.dismiss(animated: true, completion: nil)
    }
    
    @objc func refreshTable() {
        dataSource.createSections(by: SortType(rawValue: segmentedControl.selectedSegmentIndex)!)
        tableView.reloadData()
    }
}

// MARK: - SearchController
extension ListViewController: UISearchBarDelegate {
    
    func setupSearch() {
        searchController.searchBar.delegate = self
        definesPresentationContext = true
        navigationItem.searchController = searchController
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        dataSource.isSearchActive = true
        dataSource.filterContentForSearchText(searchText)
        tableView.reloadData()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        tableView.tableHeaderView = nil
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        tableView.setTableHeaderView(headerView: segmentedControl)
        tableView.updateHeaderView()
        dataSource.isSearchActive = false
        dataSource.filteredResults.removeAll()
        tableView.reloadData()
    }
}

// MARK: - UITableViewDelegate
extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let backgroundView = UIView()
        backgroundView.backgroundColor = .tableHeaderViewColor
        
        let header = view as! UITableViewHeaderFooterView
        header.backgroundView = backgroundView
        header.textLabel?.textColor = .secondaryTextColor
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        let item = dataSource.getCorrectCellItem(path: indexPath)
        let detailVC = DetailViewController(item: item, sections: (item as? Sectionable)?.sections ?? [], filter: filter)
        detailVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
