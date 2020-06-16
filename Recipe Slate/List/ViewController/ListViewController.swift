//
//  ListViewController.swift
//  Recipe Slate
//
//  Created by martin on 12.04.17.
//  Copyright © 2017 Martin List. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    typealias DataSource = ListDataSource & UITableViewDataSource

    let searchController = UISearchController(searchResultsController: nil)
    var tableView = ListTableView()
    var dataSource: DataSource
    
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
    }
    
    func setupViews() {        
        dataSource.createSections()
        
        tableView.delegate = self
        tableView.dataSource = dataSource   
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])
    }
    
    @objc func refreshTable() {
        dataSource.createSections()
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: - SearchController

extension ListViewController: UISearchResultsUpdating, UISearchBarDelegate {
    
    func setupSearch() {
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.searchBar.keyboardAppearance = .dark
        
        if #available(iOS 13.0, *) {
            searchController.searchBar.searchTextField.backgroundColor = .white
            searchController.searchBar.searchTextField.leftView?.tintColor = .gray
            searchController.searchBar.searchTextField.tintColor = .headerBlue
            
        }
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.gray]
        
        definesPresentationContext = true
        navigationItem.searchController = searchController
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        dataSource.filterContentForSearchText(text)
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        dataSource.filteredResults.removeAll()
    }
}

extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .tableHeaderViewColor
        
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = .white
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        let item = dataSource.getCorrectCellItem(path: indexPath)
        let detailVC = DetailViewController(item: item)
        detailVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
