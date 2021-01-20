//
//  UserDetailRouter.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 20.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation
import UIKit

class UserDetailRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule(with userName: String, _ repoName: String) -> UserDetailViewController {
        let viewController = UIStoryboard.loadViewController() as UserDetailViewController
        let presenter = UserDetailPresenter()
        let router = UserDetailRouter()
        let interactor = UserDetailInteractor()

        viewController.presenter =  presenter
        viewController.modalPresentationStyle = .fullScreen

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension UserDetailRouter: IUserDetailRouter {
    // TODO: Implement wireframe methods
}
