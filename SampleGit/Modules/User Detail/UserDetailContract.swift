//
//  UserDetailContract.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 20.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation

protocol IUserDetailView: IBaseView {
    // TODO: Declare view methods
}

protocol IUserDetailPresenter: IBasePresenter {
    func setClickedUserName(_ userName: String)
}

protocol IUserDetailInteractor: class {
    func retrieveUserDetails(with userName: String)
    func retrieveUserRepositories(with userName: String)
}

protocol IUserDetailInteractorToPresenter: IBaseInteractorToPresenter {
    func userDetailsRecieved(_ userDetails: UserDetail)
    func userReposRecieved(_ repoList: [Repository])
}

protocol IUserDetailRouter: class {
    // TODO: Declare wireframe methods
}
