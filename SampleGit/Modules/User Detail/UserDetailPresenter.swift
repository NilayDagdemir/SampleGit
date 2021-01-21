//
//  UserDetailPresenter.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 20.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

class UserDetailPresenter {

    // MARK: Properties
    weak var view: IUserDetailView?
    var interactor: IUserDetailInteractor?
    var router: IUserDetailRouter?

    private var userName: String?
    private var userDetail: UserDetail?
    private var userRepos: [Repository] = [Repository]()
    private var currentPage: Int = 0
}

extension UserDetailPresenter: IUserDetailPresenter {
    func viewDidLoad() {
        view?.showProgressHUD()
        if let userName = userName {
            interactor?.retrieveUserDetails(with: userName)
            interactor?.retrieveUserRepositories(with: userName)
        }
    }

    func setClickedUserName(_ userName: String) {
        self.userName = userName
    }

    func getUserDetail() -> UserDetail? {
        return userDetail ?? nil
    }

    func getUserRepos() -> [Repository] {
        return userRepos
    }

    func itemExistsOnTableView() -> Bool {
        return !(userRepos.isEmpty)
    }

    func fetchUserRepos() {
        view?.showProgressHUD()
        // TODO: pageNumber ve count gerekiyor mu?
        if let userName = userName {
            currentPage += 1
            interactor?.retrieveUserRepositories(with: userName)
        }
        //interactor?.searchRepos(with: latestSearchText, perPage: Constants.SearchRepositories.filteredItemCountPerPage, pageNumber: currentPage)
    }

    func repoURLTapped(with repoURL: String) {
        router?.navigateToURL(link: repoURL)
    }

    func tableViewScrolled(with scrollPosition: CGFloat, _ scrollHeight: CGFloat) {
        view?.scrollViewScrolled(with: scrollPosition, scrollHeight)
    }

    func getIsAlreadyFetchingRepos() -> Bool {
        return interactor?.getIsAlreadyFetchingRepos() ?? false
    }
}

extension UserDetailPresenter: IUserDetailInteractorToPresenter {
    func wsErrorOccurred(with message: String) {
        view?.hideProgressHUD()
        view?.showErrorDialog(with: message)
    }

    func userDetailsRecieved(_ userDetails: UserDetail) {
        self.userDetail = userDetails
    }

    func userReposRecieved(_ repoList: [Repository]) {
        self.userRepos.append(contentsOf: repoList)
        view?.hideProgressHUD()
        view?.reloadTableView()
        if userRepos.isEmpty {
            view?.showErrorDialog(with: Constants.Error.noRepoFound)
        }
    }
}
