//
//  UserDetailTableViewAdapter.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 20.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

class UserDetailTableViewAdapter: NSObject {
    private let presenter: IUserDetailPresenter

    init(presenter: IUserDetailPresenter) {
        self.presenter = presenter
    }
}

extension UserDetailTableViewAdapter: IBaseAdapter {
    func itemCount() -> Int {
        // Plus 1 is for user detail cell
        return getUserRepos().count
    }

    func sectionCount() -> Int {
        return 2
    }

    func getUserDetail() -> UserDetail? {
        return presenter.getUserDetail() ?? nil
    }

    func getUserRepos() -> [Repository] {
        return presenter.getUserRepos()
    }
}

extension UserDetailTableViewAdapter: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionCount()
    }

    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == Constants.UserDetails.UserDetailTableViewCellTypes.userDetail.rawValue {
            return 1
        } else if section == Constants.UserDetails.UserDetailTableViewCellTypes.userRepo.rawValue {
            return itemCount()
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        if section == Constants.UserDetails.UserDetailTableViewCellTypes.userDetail.rawValue {
            return setupUserDetailTableViewCell(tableView: tableView, indexPath: indexPath)
        } else if section == Constants.UserDetails.UserDetailTableViewCellTypes.userRepo.rawValue {
            return setupUserRepoTableViewCell(tableView: tableView, indexPath: indexPath)
        }
        return UITableViewCell()
    }

    private func setupUserDetailTableViewCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let identifier = UserDetailTableViewCell.nameOfClass
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        if let cell = cell as? UserDetailTableViewCell, let userItem = getUserDetail() {
            cell.setup(userItem: userItem)

            return cell
        }
        return UITableViewCell()
    }

    private func setupUserRepoTableViewCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let identifier = RepoDetailTableViewCell.nameOfClass
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        if let cell = cell as? RepoDetailTableViewCell {
            cell.setup(repoItem: getUserRepos()[indexPath.row])
            // TODO: delegate olmama durumunu test et. bir problem oluyor mu?
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.SearchRepositories.tableViewRowHeight
    }
}

extension UserDetailTableViewAdapter: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        switch scrollView.panGestureRecognizer.state {
            case .began:
                let scrollPosition = scrollView.contentOffset.y
                presenter.scrollViewDidScrollTriggered(with: scrollPosition)
            default:
                break
        }
    }
}
