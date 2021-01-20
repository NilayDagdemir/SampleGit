//
//  RepositoryDetailRouter.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 20.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation
import UIKit

class RepositoryDetailRouter {

    // MARK: Properties
    weak var view: UIViewController?

    // MARK: Static methods
    static func setupModule(with repoDetailItem: Repository) -> RepositoryDetailViewController {
        let viewController = UIStoryboard.loadViewController() as RepositoryDetailViewController
        let presenter = RepositoryDetailPresenter()
        let router = RepositoryDetailRouter()
        let interactor = RepositoryDetailInteractor()

        viewController.presenter =  presenter
        viewController.modalPresentationStyle = .fullScreen

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        presenter.setSelectedRepoDetailItem(to: repoDetailItem)

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension RepositoryDetailRouter: IRepositoryDetailRouter {
    func navigateToUserDetailScreen(with userName: String) {
        view?.navigationController?.pushViewController(UserDetailRouter.setupModule(with: userName), animated: true)
    }

    func navigateToURL(link: String) {
        UIApplication.shared.openUrl(link)
    }
}
