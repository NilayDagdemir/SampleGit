//
//  SearchRepositoriesViewController.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 18.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

class SearchRepositoriesViewController: UIViewController {

    // MARK: Properties
    var presenter: ISearchRepositoriesPresenter?

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SearchRepositoriesViewController: ISearchRepositoriesView {
    // TODO: implement view output methods
}
