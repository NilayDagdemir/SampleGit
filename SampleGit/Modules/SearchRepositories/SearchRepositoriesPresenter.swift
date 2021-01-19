//
//  SearchRepositoriesPresenter.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 19.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation

class SearchRepositoriesPresenter {

    // MARK: Properties
    weak var view: ISearchRepositoriesView?
    var router: ISearchRepositoriesRouter?
    var interactor: ISearchRepositoriesInteractor?

    private var filteredRepos = [Repository]()
}

extension SearchRepositoriesPresenter: ISearchRepositoriesPresenter {
    func viewDidLoad() {}

    func filterItems(with searchText: String, _ pageNumber: Int) {
        view?.closeSearchBar()
        if searchText != "" {
            view?.showProgressHUD()
            interactor?.searchRepos(with: searchText, perPage: Constants.SearchRepositories.filteredItemCountPerPage, pageNumber: pageNumber)
        }
    }

    func getFilteredRepos() -> [Repository] {
        return filteredRepos
    }

    func repoCardClicked(with repoItem: Repository) {
        router?.navigateToRepoDetailScreen(of: repoItem)
    }

    func avatarClicked(with repoItem: Repository) {
        router?.navigateToUserDetailScreen(of: repoItem)
    }
}

extension SearchRepositoriesPresenter: ISearchRepositoriesInteractorToPresenter {
    func wsErrorOccurred(with message: String) {
        view?.hideProgressHUD()
        view?.showErrorDialog(with: message)
    }

    func repoListFiltered(_ repoList: [Repository]) {
        self.filteredRepos = repoList
        view?.hideProgressHUD()
        view?.reloadTableView()
        if filteredRepos.isEmpty {
            view?.showErrorDialog(with: Constants.Error.noRepoFound)
        }
    }
}
