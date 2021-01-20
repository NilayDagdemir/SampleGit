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
    func userAvatarClicked(with userName: String)
    func repoURLTapped(with repoURL: String)
    func avatarClicked()
}

protocol IRepositoryDetailRouter: class {
    func navigateToUserDetailScreen(with userName: String)
    func navigateToURL(link: String)
}
