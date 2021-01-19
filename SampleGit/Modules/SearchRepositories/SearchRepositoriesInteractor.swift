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
}

extension SearchRepositoriesInteractor: ISearchRepositoriesInteractor {
    func searchRepos(with searchText: String, perPage: Int, pageNumber: Int) {
        networkAPI?.searchRepositories(with: searchText, perPage: perPage, pageNumber: pageNumber, onSuccess: { [weak self] response in
            guard let self = self else { return }
            if let filteredList = response.items?.items {
                self.output?.repoListFiltered(filteredList)
            } else {
                self.output?.wsErrorOccurred(with: Constants.Error.defaultErrorMessage)
            }
            }, onError: { error in
                self.output?.wsErrorOccurred(with: error?.statusMessage ?? Constants.Error.defaultErrorMessage)
        })
    }
}
