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

    private var isAlreadyFetchingRepos: Bool = false
    private var itemCountPerPage: Int = 0
}

extension UserDetailInteractor: IUserDetailInteractor {
    func setItemCountPerPage(with perPage: Int) {
        itemCountPerPage = perPage
    }

    func getIsAlreadyFetchingRepos() -> Bool {
        return isAlreadyFetchingRepos
    }

    func retrieveUserDetails(with userName: String) {
        networkAPI?.getUserDetail(with: userName, onSuccess: { [weak self] response in
            guard let self = self else { return }
            if let userDetails = response.results {
                self.output?.userDetailsRecieved(userDetails)
            } else {
                self.output?.wsErrorOccurred(with: Constants.Error.defaultErrorMessage)
            }
        })
    }

    func retrieveUserRepositories(with userName: String, pageNumber: Int) {
        if !isAlreadyFetchingRepos {
            let itemCountPerPage = Constants.UserDetails.filteredItemCountPerPage
            isAlreadyFetchingRepos = true
            networkAPI?.getUserRepos(with: userName,
                                     itemCountPerPage,
                                     pageNumber,
                                     onSuccess: { [weak self] response in
                guard let self = self else { return }
                    if let userRepos = response.results {
                        if userRepos.isEmpty {
                            self.output?.noMoreRepoFound()
                        } else {
                            self.output?.increaseCurrentPage()
                            self.output?.userReposRecieved(userRepos)
                        }
                    } else {
                        self.output?.wsErrorOccurred(with: Constants.Error.defaultErrorMessage)
                    }
                    self.isAlreadyFetchingRepos = false
            })
        }
    }
}
