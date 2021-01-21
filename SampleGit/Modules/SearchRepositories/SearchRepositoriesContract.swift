//
//  SearchRepositoriesContract.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 19.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

protocol RepoTableViewCellDelegate: AnyObject {
    func avatarClicked(with userName: String)
    func repoCardClicked(with repoItem: Repository)
}

protocol ISearchRepositoriesView: IBaseView {
    func reloadTableView()
    func closeSearchBar()
    func clearSpinnerView()
    func scrollViewScrolled(with scrollPosition: CGFloat, _ scrollHeight: CGFloat)
}

protocol ISearchRepositoriesPresenter: IBasePresenter {
    func filterItems(with searchText: String, _ pageNumber: Int)
    func getFilteredRepos() -> [Repository]
    func itemExistsOnTableView() -> Bool
    func repoCardClicked(with repoItem: Repository)
    func avatarClicked(with userName: String)
    func fetchData()
    func tableViewScrolled(with scrollPosition: CGFloat, _ scrollHeight: CGFloat) 
    func getIsAlreadyFetchingRepos() -> Bool
}

protocol ISearchRepositoriesInteractor: class {
    func setItemCountPerPage(with perPage: Int)
    func searchRepos(with searchText: String, pageNumber: Int)
    func getIsAlreadyFetchingRepos() -> Bool
}

protocol ISearchRepositoriesInteractorToPresenter: IBaseInteractorToPresenter {
    func repoListFiltered(_ repoList: [Repository])
    func increaseCurrentPage()
    func noMoreRepoFound()
}

protocol ISearchRepositoriesRouter: class {
    func navigateToRepoDetailScreen(with repoDetailItem: Repository)
    func navigateToUserDetailScreen(with userName: String)
}
