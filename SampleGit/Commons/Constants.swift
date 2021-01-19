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
        static let noOverviewTextExists: String = "**No overview exists for this one**"
        static let noSearchTextEntered: String = "Please enter a repository name."
        static let noRepoFound: String = "No repository found."
        static let invalidURL: String = "Invalid URL."
    }

    // MARK: Common
//    enum PosterProperties: String {
//        case low, high
//
//        var resolution: String {
//            switch self {
//            case .low: return "w300"
//            case .high: return "w780"
//            }
//        }
//    }

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
        static let filteredItemCountPerPage: Int = 100
    }

//    // MARK: Movie Detail Collection View Cells
//    enum MovieDetailSectionHeaderCells: String {
//        case video, cast
//
//        var title: String {
//            switch self {
//            case .video: return "Videos:"
//            case .cast: return "Cast:"
//            }
//        }
//    }
//
//    static func getVideoURL(from base: String, _ key: String) -> String {
//        switch base {
//        case "YouTube": return "https://www.youtube.com/watch?v=\(key)"
//        case "Vimeo": return "https://vimeo.com/\(key)"
//        default: return ""
//        }
//    }
}
