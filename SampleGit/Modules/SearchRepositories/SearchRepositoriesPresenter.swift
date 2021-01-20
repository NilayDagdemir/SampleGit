//
//  SearchRepositoriesPresenter.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 19.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

class SearchRepositoriesPresenter {

    // MARK: Properties
    weak var view: ISearchRepositoriesView?
    var router: ISearchRepositoriesRouter?
    var interactor: ISearchRepositoriesInteractor?

    private var filteredRepos: [Repository] = [Repository]()
    private var latestSearchText: String = ""
    private var currentPage: Int = 1
}

extension SearchRepositoriesPresenter: ISearchRepositoriesPresenter {
    func viewDidLoad() {}

    func filterItems(with searchText: String, _ pageNumber: Int) {
        view?.closeSearchBar()
        if searchText != "" {
            latestSearchText = searchText
            fetchData()
        }
    }

    func getFilteredRepos() -> [Repository] {
        return filteredRepos
    }

    func itemExistsOnTableView() -> Bool {
        return !(filteredRepos.isEmpty)
    }

    func repoCardClicked(with repoItem: Repository) {
        router?.navigateToRepoDetailScreen(with: repoItem)
    }

    func avatarClicked(with userName: String) {
        router?.navigateToUserDetailScreen(with: userName)
    }

    func scrollViewDidScrollTriggered(with scrollPosition: CGFloat) {
        view?.scrollViewScrolled(with: scrollPosition)
    }

    func fetchData() {
        if latestSearchText != "" {
            view?.showProgressHUD()
            print("here to fetch!")
            interactor?.searchRepos(with: latestSearchText,
                                    perPage: Constants.SearchRepositories.filteredItemCountPerPage,
                                    pageNumber: currentPage)
        }
    }
}

extension SearchRepositoriesPresenter: ISearchRepositoriesInteractorToPresenter {
    func wsErrorOccurred(with message: String) {
        view?.hideProgressHUD()
        view?.showErrorDialog(with: message)
    }

    func repoListFiltered(_ repoList: [Repository]) {
        self.filteredRepos = repoList
        currentPage += 1
        view?.hideProgressHUD()
        view?.reloadTableView()
        if filteredRepos.isEmpty {
            view?.showErrorDialog(with: Constants.Error.noRepoFound)
        }
    }
}
