//
//  RepositoryDetailPresenter.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 20.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation

class RepositoryDetailPresenter {

    // MARK: Properties
    weak var view: IRepositoryDetailView?
    var router: IRepositoryDetailRouter?
    var interactor: IRepositoryDetailInteractor?

    private var repoDetailItem: Repository?
}

extension RepositoryDetailPresenter: IRepositoryDetailPresenter {
    func viewDidLoad() {
        view?.setUIElements()
    }
    
    func setSelectedRepoDetailItem(to repoDetailItem: Repository) {
        self.repoDetailItem = repoDetailItem
    }

    func getRepoDetailItem() -> Repository? {
        return repoDetailItem ?? nil
    }

    func userAvatarClicked(with userName: String) {
        router?.navigateToUserDetailScreen(with: userName)
    }

    func repoURLTapped(with repoURL: String) {
        router?.navigateToURL(link: repoURL)
    }
}

extension RepositoryDetailPresenter: IRepositoryDetailInteractorToPresenter {}
