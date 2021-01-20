//
//  RepositoryDetailContract.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 20.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation

protocol IRepositoryDetailView: IBaseView {
    func setUIElements()
}

protocol IRepositoryDetailPresenter: IBasePresenter {
    func setSelectedRepoDetailItem(to repoDetailItem: Repository)
    func getRepoDetailItem() -> Repository?
    func userAvatarClicked(with userName: String, _ repoName: String)
}

protocol IRepositoryDetailInteractor: class {
    // TODO: Declare use case methods
}

protocol IRepositoryDetailInteractorToPresenter: class {
    // TODO: Declare interactor output methods
}

protocol IRepositoryDetailRouter: class {
    func navigateToUserDetailScreen(with userName: String, _ repoName: String)
}
