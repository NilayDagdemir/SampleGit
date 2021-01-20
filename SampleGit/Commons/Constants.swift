//
//  Constants.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 19.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

class Constants {
    struct Error {
        static let defaultErrorMessage: String = "An error occured. Please try again later."
        static let noOverviewTextExists: String = "**No info exists**"
        static let noSearchTextEntered: String = "Please enter a repository name."
        static let noRepoFound: String = "No repository found."
        static let invalidURL: String = "Invalid URL."
    }

    // MARK: SearchRepositories
    struct SearchRepositories {
        // MARK: Navigation Bar
        static let navBarTitle: String = "Find Repositories"

        // MARK: Repo Not Found Popup
        static let repoNotFoundPopupMessage: String = "Repo not found."

        // MARK: SearchRepositories Table View
        static let tableViewRowHeight: CGFloat = 100

        // MARK: SearchBar
        static let searchBarPlaceholder: String = "Enter a repository name."

        // MARK GitHub API Search Parameter
        static let filteredItemCountPerPage: Int = 40
    }

    // MARK: RepositoryDetail
    struct RepositoryDetail {
        // MARK: Repo Detail Card Items
        static let ownerTypePrefix: String = "Owner Type: "
        static let branchNamePrefix: String = "Default Branch: "
    }
}
