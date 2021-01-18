//
//  SearchRepositoriesRouter.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 18.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

class SearchRepositoriesRouter {

    // MARK: Properties
    weak var view: UIViewController?

    // MARK: Static methods
    static func setupModule() -> SearchRepositoriesViewController {
        let viewController = SearchRepositoriesViewController()
        let presenter = SearchRepositoriesPresenter()
        let router = SearchRepositoriesRouter()
        let interactor = SearchRepositoriesInteractor()

        viewController.presenter =  presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension SearchRepositoriesRouter: ISearchRepositoriesRouter {
    // TODO: Implement wireframe methods
}
