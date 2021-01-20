//
//  UserDetailInteractor.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 20.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation

class UserDetailInteractor {

    // MARK: Properties
    weak var output: IUserDetailInteractorToPresenter?
    var networkAPI: APIClient?
}

extension UserDetailInteractor: IUserDetailInteractor {
    func retrieveUserDetails(with userName: String) {
        networkAPI?.getUserDetail(with: userName, onSuccess: { [weak self] response in
            guard let self = self else { return }
            print("here res: \(response.results) and \(response)")
            if let userDetails = response.results {
                self.output?.userDetailsRecieved(userDetails)
            } else {
                self.output?.wsErrorOccurred(with: Constants.Error.defaultErrorMessage)
            }
        })
    }

    func retrieveUserRepositories(with userName: String) {
        networkAPI?.getUserRepos(with: userName, onSuccess: { [weak self] response in
            guard let self = self else { return }
            print("here w response: \(response.results) and res is: \(response)")
            if let userRepos = response.results {
                self.output?.userReposRecieved(userRepos)
            } else {
                self.output?.wsErrorOccurred(with: Constants.Error.defaultErrorMessage)
            }
        })
    }
}
