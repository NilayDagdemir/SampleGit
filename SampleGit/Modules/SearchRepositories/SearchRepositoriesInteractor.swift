//
//  SearchRepositoriesInteractor.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 19.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation

class SearchRepositoriesInteractor {

    // MARK: Properties
    weak var output: ISearchRepositoriesInteractorToPresenter?
    var networkAPI: APIClientInterface?

    private var isAlreadyFetchingRepos: Bool = false
}

extension SearchRepositoriesInteractor: ISearchRepositoriesInteractor {
    func getIsAlreadyFetchingRepos() -> Bool {
        return isAlreadyFetchingRepos
    }

    func searchRepos(with searchText: String, perPage: Int, pageNumber: Int) {
        if !isAlreadyFetchingRepos {
            isAlreadyFetchingRepos = true
            networkAPI?.searchRepositories(with: searchText,
                                           perPage: perPage,
                                           pageNumber: pageNumber,
                                           onSuccess: { [weak self] response in
                guard let self = self else { return }
                if let filteredList = response.results?.items {
                    self.output?.repoListFiltered(filteredList)
                } else {
                    self.output?.wsErrorOccurred(with: Constants.Error.defaultErrorMessage)
                }
                self.isAlreadyFetchingRepos = false
            })
        }
    }
}
