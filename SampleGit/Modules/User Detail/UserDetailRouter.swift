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
    static func setupModule(with userName: String) -> UserDetailViewController {
        let viewController = UIStoryboard.loadViewController() as UserDetailViewController
        let presenter = UserDetailPresenter()
        let router = UserDetailRouter()
        let interactor = UserDetailInteractor()
        let networkAPI = APIClient()
        let adapter = UserDetailTableViewAdapter(presenter: presenter)

        viewController.presenter =  presenter
        viewController.modalPresentationStyle = .fullScreen
        viewController.adapter = adapter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        presenter.setClickedUserName(userName)

        router.view = viewController

        interactor.output = presenter
        interactor.networkAPI = networkAPI

        return viewController
    }
}

extension UserDetailRouter: IUserDetailRouter {
    func navigateToURL(link: String) {
        UIApplication.shared.openUrl(link)
    }
}
