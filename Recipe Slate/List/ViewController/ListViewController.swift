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

    let searchController = UISearchController(searchResultsController: nil)
    var tableView = ListTableView()
    var dataSource: DataSource
    var segmentedControl = SegmentedControl()
    lazy var aboutViewController: UIHostingController = {
        UIHostingController(rootView: AboutView(store: AboutStore()))
    }()
    
    init(dataSource: DataSource) {
        self.dataSource = dataSource
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
        setupNotifications()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.updateHeaderView()
     }
    
    // MARK: - User Interface
    
    func setupViews() {        
        dataSource.createSections(by: .alphabetically)
        tableView.delegate = self
        tableView.dataSource = dataSource
        tableView.setTableHeaderView(headerView: segmentedControl)
        segmentedControl.addTarget(self, action: #selector(refreshTable) , for: UIControl.Event.valueChanged)
        view.addSubview(tableView)
        
        let barButton = UIBarButtonItem.barButton(with: "bar-about", target: self, selector: #selector(openAbout))
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
    
    // MARK: - Actions
    
    func setupNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(dismissAbout),
                                               name: .RecipeSlateDismissAboutPressed, object: nil)
    }
    
    @objc func openAbout() {
        let barButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissAbout))
        aboutViewController.navigationItem.rightBarButtonItem = barButton
        navigationController?.present(NavigationController(rootViewController: aboutViewController), animated: true, completion: nil)
    }
    
    @objc func dismissAbout() {
        aboutViewController.dismiss(animated: true, completion: nil)
    }
    
    @objc func refreshTable() {
        dataSource.createSections(by: SortType(rawValue: segmentedControl.selectedSegmentIndex)!)
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: - SearchController

extension ListViewController: UISearchBarDelegate {
    
    func setupSearch() {
        searchController.searchBar.delegate = self
        
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.searchBar.keyboardAppearance = .dark
        
        searchController.searchBar.searchTextField.backgroundColor = #colorLiteral(red: 0.01713882573, green: 0.3089093566, blue: 0.4661796689, alpha: 1)
        searchController.searchBar.searchTextField.tintColor = .white
        
        definesPresentationContext = true
        navigationItem.searchController = searchController
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        dataSource.filterContentForSearchText(searchText)
        tableView.reloadData()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        tableView.tableHeaderView = nil
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        tableView.updateHeaderView()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        dataSource.filteredResults.removeAll()
    }
}

extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .tableHeaderViewColor
        
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = .secondaryTextColor
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        let item = dataSource.getCorrectCellItem(path: indexPath)
        let detailVC = DetailViewController(item: item, sections: (item as? Sectionable)?.sections ?? [])
        detailVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
