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
    private var itemCountPerPage: Int = 0
}

extension SearchRepositoriesInteractor: ISearchRepositoriesInteractor {
    func setItemCountPerPage(with perPage: Int) {
        itemCountPerPage = perPage
    }

    func getIsAlreadyFetchingRepos() -> Bool {
        return isAlreadyFetchingRepos
    }

    func searchRepos(with searchText: String, pageNumber: Int) {
        if !isAlreadyFetchingRepos {
            isAlreadyFetchingRepos = true
            networkAPI?.searchRepositories(with: searchText,
                                           itemCountPerPage,
                                           pageNumber,
                                           onSuccess: { [weak self] response in
                guard let self = self else { return }
                if let filteredList = response.results?.items {
                    if filteredList.isEmpty {
                        if self.itemCountPerPage != 0 {
                            self.isAlreadyFetchingRepos = false
                            self.itemCountPerPage -= 1
                            self.searchRepos(with: searchText, pageNumber: pageNumber)
                        } else {
                            self.output?.noMoreRepoFound()
                        }
                    } else {
                        self.output?.increaseCurrentPage()
                        self.output?.repoListFiltered(filteredList)
                    }
                } else {
                    self.output?.wsErrorOccurred(with: Constants.Error.defaultErrorMessage)
                }
                self.isAlreadyFetchingRepos = false
            })
        }
    }
}
