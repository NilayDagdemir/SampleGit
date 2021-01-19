//
//  SearchRepositoriesContract.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 19.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation

protocol RepoTableViewCellDelegate: AnyObject {
    func avatarClicked(with repoItem: Repository)
    func repoCardClicked(with repoItem: Repository)
}

protocol ISearchRepositoriesView: IBaseView {
    func reloadTableView()
    func closeSearchBar()
}

protocol ISearchRepositoriesPresenter: IBasePresenter {
    func filterItems(with searchText: String, _ pageNumber: Int)
    func getFilteredRepos() -> [Repository]
    func repoCardClicked(with repoItem: Repository)
    func avatarClicked(with repoItem: Repository)
}

protocol ISearchRepositoriesInteractor: class {
    func searchRepos(with searchText: String, perPage: Int, pageNumber: Int)
}

protocol ISearchRepositoriesInteractorToPresenter: IBaseInteractorToPresenter {
    func repoListFiltered(_ repoList: [Repository])
}

protocol ISearchRepositoriesRouter: class {
    func navigateToRepoDetailScreen(of repoItem: Repository)
    func navigateToUserDetailScreen(of repoItem: Repository)
}
