//
//  SearchRepositoriesPresenter.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 18.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation

class SearchRepositoriesPresenter {

    // MARK: Properties
    weak var view: ISearchRepositoriesView?
    var router: ISearchRepositoriesRouter?
    var interactor: ISearchRepositoriesInteractor?
}

extension SearchRepositoriesPresenter: ISearchRepositoriesPresenter {
    func viewDidLoad() {
        print("here entered view did load")
    }
}

extension SearchRepositoriesPresenter: ISearchRepositoriesInteractorToPresenter {
    func wsErrorOccurred(with message: String) {
        print("here err occured")
    }
}
