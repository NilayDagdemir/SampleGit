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
        filteredRepos = [Repository]()
        currentPage = 1
        if searchText != "" {
            latestSearchText = searchText
            interactor?.setItemCountPerPage(with: Constants.SearchRepositories.filteredItemCountPerPage)
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

    func fetchData() {
        if latestSearchText != "" {
            interactor?.searchRepos(with: latestSearchText,
                                    pageNumber: currentPage)
        }
    }

    func tableViewScrolled(with scrollPosition: CGFloat, _ scrollHeight: CGFloat) {
        view?.scrollViewScrolled(with: scrollPosition, scrollHeight)
    }

    func getIsAlreadyFetchingRepos() -> Bool {
        return interactor?.getIsAlreadyFetchingRepos() ?? false
    }
}

extension SearchRepositoriesPresenter: ISearchRepositoriesInteractorToPresenter {
    func wsErrorOccurred(with message: String) {
        view?.hideProgressHUD()
        view?.showErrorDialog(with: message)
    }

    func repoListFiltered(_ repoList: [Repository]) {
        self.filteredRepos.append(contentsOf: repoList)
        view?.hideProgressHUD()
        view?.clearSpinnerView()
        view?.reloadTableView()
        if filteredRepos.isEmpty {
            view?.showErrorDialog(with: Constants.Error.noRepoFound)
        }
    }

    func increaseCurrentPage() {
        currentPage += 1
    }

    func noMoreRepoFound() {
        view?.clearSpinnerView()
    }
}
