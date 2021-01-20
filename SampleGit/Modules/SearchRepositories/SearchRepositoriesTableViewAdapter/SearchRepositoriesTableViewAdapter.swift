//
//  SearchRepositoriesTableViewAdapter.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 19.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

class SearchRepositoriesTableViewAdapter: NSObject {
    private let presenter: ISearchRepositoriesPresenter

    init(presenter: ISearchRepositoriesPresenter) {
        self.presenter = presenter
    }
}

extension SearchRepositoriesTableViewAdapter: IBaseAdapter {
    func itemCount() -> Int {
        return getFilteredRepos().count
    }

    func getFilteredRepos() -> [Repository] {
        return presenter.getFilteredRepos()
    }
}

extension SearchRepositoriesTableViewAdapter: UITableViewDelegate, UITableViewDataSource {

    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return setupFilteredRepoTableViewCell(tableView: tableView, indexPath: indexPath)
    }

    private func setupFilteredRepoTableViewCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let identifier = RepoTableViewCell.nameOfClass
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        if let cell = cell as? RepoTableViewCell {
            cell.setup(repoItem: getFilteredRepos()[indexPath.row])
            cell.delegate = self

            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.SearchRepositories.tableViewRowHeight
    }
}

extension SearchRepositoriesTableViewAdapter: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.panGestureRecognizer.state == .began {
            let scrollPosition = scrollView.contentOffset.y
            presenter.scrollViewDidScrollTriggered(with: scrollPosition)
        }
    }
}

extension SearchRepositoriesTableViewAdapter: RepoTableViewCellDelegate {
    func repoCardClicked(with repoItem: Repository) {
        presenter.repoCardClicked(with: repoItem)
    }

    func avatarClicked(with userName: String) {
        presenter.avatarClicked(with: userName)
    }
}
