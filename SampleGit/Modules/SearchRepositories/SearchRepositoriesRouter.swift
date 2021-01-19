//
//  SearchRepositoriesRouter.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 19.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

class SearchRepositoriesRouter {

    // MARK: Properties
    weak var view: UIViewController?

    // MARK: Static methods
    static func setupModule() -> SearchRepositoriesViewController {
        let viewController = UIStoryboard.loadViewController() as SearchRepositoriesViewController
        let presenter = SearchRepositoriesPresenter()
        let router = SearchRepositoriesRouter()
        let interactor = SearchRepositoriesInteractor()
        let networkAPI = APIClient()
        let adapter = SearchRepositoriesTableViewAdapter(presenter: presenter)

        viewController.presenter =  presenter
        viewController.modalPresentationStyle = .fullScreen
        viewController.adapter = adapter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter
        interactor.networkAPI = networkAPI

        return viewController
    }
}

extension SearchRepositoriesRouter: ISearchRepositoriesRouter {
    func navigateToRepoDetailScreen(of repoItem: Repository) {
        // TODO: navigate to repo details
//        if let movieId = movieItem.id {
//            let movieDetailVC = MovieDetailRouter.setupModule(with: movieId)
//            view?.navigationController?.pushViewController(movieDetailVC, animated: true)
//        } else {
//            view?.showErrorDialog(with: Constants.Error.defaultErrorMessage)
//        }
    }

    func navigateToUserDetailScreen(of repoItem: Repository) {
        // TODO: navigate to user details
//        if let movieId = movieItem.id {
//            let movieDetailVC = MovieDetailRouter.setupModule(with: movieId)
//            view?.navigationController?.pushViewController(movieDetailVC, animated: true)
//        } else {
//            view?.showErrorDialog(with: Constants.Error.defaultErrorMessage)
//        }
    }
}
