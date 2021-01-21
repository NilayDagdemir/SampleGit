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
    private var currentPage: Int = 1
}

extension UserDetailPresenter: IUserDetailPresenter {
    func viewDidLoad() {
        view?.showProgressHUD()
        if let userName = userName {
            interactor?.retrieveUserDetails(with: userName)
            print("here to retreive user repos 0")
            interactor?.retrieveUserRepositories(with: userName,
                                                 pageNumber: currentPage)
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
        if let userName = userName {
            print("here to retreive user repos")
            interactor?.retrieveUserRepositories(with: userName,
                                                 pageNumber: currentPage)
        }
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
        view?.hideProgressHUD()
    }

    func userReposRecieved(_ repoList: [Repository]) {
        self.userRepos.append(contentsOf: repoList)
        view?.hideProgressHUD()
        view?.clearSpinnerView()
        view?.reloadTableView()
        if userRepos.isEmpty {
            view?.showErrorDialog(with: Constants.Error.noRepoFound)
        }
    }

    func increaseCurrentPage() {
        currentPage += 1
    }

    func noMoreRepoFound() {
        view?.clearSpinnerView()
    }
}
