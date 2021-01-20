//
//  SearchRepositoriesContract.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 19.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

protocol RepoTableViewCellDelegate: AnyObject {
    func avatarClicked(with userName: String, _ repoName: String)
    func repoCardClicked(with repoItem: Repository)
}

protocol ISearchRepositoriesView: IBaseView {
    func reloadTableView()
    func closeSearchBar()
    func scrollViewScrolled(with scrollPosition: CGFloat)
}

protocol ISearchRepositoriesPresenter: IBasePresenter {
    func filterItems(with searchText: String, _ pageNumber: Int)
    func getFilteredRepos() -> [Repository]
    func itemExistsOnTableView() -> Bool
    func repoCardClicked(with repoItem: Repository)
    func avatarClicked(with userName: String, _ repoName: String)
    func scrollViewDidScrollTriggered(with scrollPosition: CGFloat)
    func fetchData()
}

protocol ISearchRepositoriesInteractor: class {
    func searchRepos(with searchText: String, perPage: Int, pageNumber: Int)
}

protocol ISearchRepositoriesInteractorToPresenter: IBaseInteractorToPresenter {
    func repoListFiltered(_ repoList: [Repository])
}

protocol ISearchRepositoriesRouter: class {
    func navigateToRepoDetailScreen(with repoDetailItem: Repository)
    func navigateToUserDetailScreen(with userName: String, _ repoName: String)
}
