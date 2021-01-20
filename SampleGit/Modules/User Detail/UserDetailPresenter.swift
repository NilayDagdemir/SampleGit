//
//  UserDetailPresenter.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 20.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation

class UserDetailPresenter {

    // MARK: Properties
    weak var view: IUserDetailView?
    var router: IUserDetailRouter?
    var interactor: IUserDetailInteractor?

    private var userName: String?
    private var userDetail: UserDetail?
    private var userRepos: [Repository] = [Repository]()
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
        self.userRepos = repoList
    }
}
