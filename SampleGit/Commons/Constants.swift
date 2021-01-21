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
        static let navBarTitle: String = "Find Repositories"

        static let repoNotFoundPopupMessage: String = "Repo not found."

        static let tableViewRowHeight: CGFloat = 100

        static let searchBarPlaceholder: String = "Enter a repository name."

        // MARK: GitHub API Search Parameter
        static let filteredItemCountPerPage: Int = 35
    }

    // MARK: RepositoryDetail
    struct RepositoryDetail {
        static let navBarTitle: String = "Repository Details"
        // MARK: Repo Detail Card Items
        static let ownerTypePrefix: String = "Owner Type: "
        static let branchNamePrefix: String = "Default Branch: "
    }

    // MARK: UserDetails
    struct UserDetails {
        static let navBarTitle: String = "User Details"
        static let repositoriesSectionTitle: String = "Repositories"
    }

    // MARK: UserDetailTableViewCellTypes
    enum UserDetailTableViewCellTypes: Int {
        case userDetail
        case userRepo
    }
}
