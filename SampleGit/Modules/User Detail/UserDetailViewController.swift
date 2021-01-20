//
//  UserDetailViewController.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 20.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation
import UIKit

class UserDetailViewController: BaseViewController, StoryboardLoadable {
    @IBOutlet weak var userDetailTableView: UITableView!

    // MARK: Properties
    var presenter: IUserDetailPresenter?
    var adapter: UserDetailTableViewAdapter?

    private var currentPageNumber: Int = 1

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        hideKeyboardWhenTappedAround()
        title = Constants.UserDetails.navBarTitle
        setupTableView()
    }

    private func setupTableView() {
        userDetailTableView?.delegate = adapter
        userDetailTableView?.dataSource = adapter
        userDetailTableView?.registerCells([UserDetailTableViewCell.self, RepoDetailTableViewCell.self])
    }
}

extension UserDetailViewController: IUserDetailView {
    func reloadTableView() {
        userDetailTableView?.reloadData()
    }

    func scrollViewScrolled(with scrollPosition: CGFloat) {
        print("here: \(presenter?.itemExistsOnTableView())")
        print("here scroll pos: \(scrollPosition) , and tv content size: \(userDetailTableView.contentSize.height)")
        if scrollPosition > userDetailTableView.contentSize.height - 100, presenter?.itemExistsOnTableView() ?? false {
            presenter?.fetchUserRepos()
        }
    }
}
