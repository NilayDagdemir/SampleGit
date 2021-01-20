//
//  UserDetailPresenter.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 20.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation

class UserDetailPresenter {

    // MARK: Properties

    weak var view: IUserDetailView?
    var router: IUserDetailRouter?
    var interactor: IUserDetailInteractor?
}

extension UserDetailPresenter: IUserDetailPresenter {
    // TODO: implement presentation methods
}

extension UserDetailPresenter: IUserDetailInteractorToPresenter {
    // TODO: implement interactor output methods
}
