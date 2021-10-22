//
//  SortViewController.swift
//  Recipe Slate
//
//  Created by martin on 10.01.21.
//  Copyright © 2021 Martin List. All rights reserved.
//

import UIKit

/// Provides a view controller for selecting sorting options.
class SortViewController: UIViewController {
    
    // MARK: - Types
    enum Section: CaseIterable {
        case main
    }
    
    // MARK: - Properties
    private lazy var tableView: ListTableView = {
        let tableView = ListTableView()
        tableView.delegate = self
        return tableView
    }()
    private lazy var dataSource: UITableViewDiffableDataSource<Section, SortingOption> = {
        return createDataSource()
    }()
    private var sortingOptions = SortingOption.allCases
    private var selectedOption: SortingOption {
        get {
            if let string = UserDefaults.standard.string(forKey: "sorting-option") {
                return SortingOption(rawValue: string) ?? .alphabet
            }
            return .alphabet
        }
        set {
            UserDefaults.standard.setValue(newValue.rawValue  , forKey: "sorting-option")
        }
    }
    
    public var delegate: SortingOptionDelegate?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        registerCells()
        update()
    }
}

// MARK: - UITableViewDiffableDataSource
extension SortViewController {
    
    func update(animate: Bool = true) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, SortingOption>()
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(sortingOptions, toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: animate)
    }
    
    func createDataSource() -> UITableViewDiffableDataSource<Section, SortingOption> {
        return UITableViewDiffableDataSource(tableView: tableView, cellProvider: { tableView, indexPath, sortingOption in
            let cell = tableView.dequeueReusableCell(
                withIdentifier: SortSelectionCell.identifier,
                for: indexPath
            )
            (cell as? SortSelectionCell)?.title = sortingOption.rawValue
            (cell as? SortSelectionCell)?.icon = sortingOption.icon
            
            let isSelected: Bool = self.selectedOption == sortingOption
            (cell as? SortSelectionCell)?.setSelection(isSelected)
            return cell
        })
    }
}

// MARK: - UITableViewDelegate
extension SortViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newOption = sortingOptions[indexPath.row]
        let isOptionAlreadySelected: Bool = selectedOption == newOption
        
        if !isOptionAlreadySelected {
            let cellsToUnselect = tableView.visibleCells.filter({ ($0 as? SortSelectionCell)?.isCurrentlySelected ?? false })
            cellsToUnselect.forEach { ($0 as? SortSelectionCell)?.setSelection(false) }
            
            selectedOption = newOption
            let cell = tableView.cellForRow(at: indexPath)
            (cell as? SortSelectionCell)?.setSelection(true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - Action
extension SortViewController {
    
    @objc func cancelAction() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func applyAction() {
        delegate?.didSelectSortingOption(selectedOption)
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - Private
private extension SortViewController {
    
    func configureViews() {
        title = "Sort by"
        tableView.dataSource = dataSource
        view.addSubview(tableView)
        configureConstraints()
        configureNavigationbar()
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])
    }
    
    func configureNavigationbar() {
        navigationController?.navigationBar.prefersLargeTitles = false
        isModalInPresentation = true
        
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelAction))
        navigationItem.leftBarButtonItem = cancelButton
        
        let applyButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(applyAction))
        navigationItem.rightBarButtonItem = applyButton
    }
    
    func registerCells() {
        tableView.register(SortSelectionCell.self,
                           forCellReuseIdentifier: SortSelectionCell.identifier)
    }
}
