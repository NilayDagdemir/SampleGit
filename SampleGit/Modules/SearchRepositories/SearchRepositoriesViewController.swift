//
//  SearchRepositoriesViewController.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 19.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation
import UIKit

class SearchRepositoriesViewController: BaseViewController, StoryboardLoadable {
    @IBOutlet weak var filteredRepositoriesTableView: UITableView!

    // MARK: Properties
    var presenter: ISearchRepositoriesPresenter?
    var adapter: SearchRepositoriesTableViewAdapter?

    private var searchBar = UISearchBar()
    private var currentPageNumber: Int = 1

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        hideKeyboardWhenTappedAround()
        title = Constants.SearchRepositories.navBarTitle
        prepareSearchBar()
        setupTableView()
    }

    private func prepareSearchBar() {
        searchBar.sizeToFit()
        searchBar.delegate = self
        closeSearchBar()
    }

    private func setupTableView() {
        filteredRepositoriesTableView?.delegate = adapter
        filteredRepositoriesTableView?.dataSource = adapter
        filteredRepositoriesTableView?.registerCell(RepoTableViewCell.self)
    }
    
    @objc func showSearchBar() {
        searchBar.becomeFirstResponder()
        navigationItem.titleView = searchBar
        searchBar.showsCancelButton = true
        navigationItem.rightBarButtonItem = nil
    }
}

extension SearchRepositoriesViewController: ISearchRepositoriesView {
    func reloadTableView() {
        filteredRepositoriesTableView?.reloadData()
    }

    func closeSearchBar() {
        searchBar.resignFirstResponder()
        navigationItem.titleView = nil
        searchBar.showsCancelButton = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search,
                                                            target: self,
                                                            action: #selector(showSearchBar))
    }

    func scrollViewScrolled(with scrollPosition: CGFloat) {
        print("here: \(presenter?.itemExistsOnTableView())")
        print("here scroll pos: \(scrollPosition) , and tv content size: \(filteredRepositoriesTableView.contentSize.height)")
        if scrollPosition > filteredRepositoriesTableView.contentSize.height - 100, presenter?.itemExistsOnTableView() ?? false {
            presenter?.fetchData()
        }
    }
}

extension SearchRepositoriesViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        closeSearchBar()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.text != "" {
            presenter?.filterItems(with: searchBar.text ?? "", currentPageNumber)
        } else {
            showErrorDialog(with: Constants.Error.noSearchTextEntered)
        }
    }
}
