//
//  UserDetailContract.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 20.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

protocol IUserDetailView: IBaseView {
    func reloadTableView()
    func scrollViewScrolled(with scrollPosition: CGFloat)
}

protocol IUserDetailPresenter: IBasePresenter {
    func setClickedUserName(_ userName: String)
    func getUserDetail() -> UserDetail?
    func getUserRepos() -> [Repository]
    func itemExistsOnTableView() -> Bool
    func scrollViewDidScrollTriggered(with scrollPosition: CGFloat)
    func fetchUserRepos()
}

protocol IUserDetailInteractor: class {
    func retrieveUserDetails(with userName: String)
    func retrieveUserRepositories(with userName: String)
}

protocol IUserDetailInteractorToPresenter: IBaseInteractorToPresenter {
    func userDetailsRecieved(_ userDetails: UserDetail)
    func userReposRecieved(_ repoList: [Repository])
}
