//
//  FilteredRepositoryList.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 18.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation

// MARK: - RepositoryList
struct RepositoryList: Codable {
    let items: [Repository]?
}

// MARK: - Repository
struct Repository: Codable {
    let name: String?
    let defaultBranch: String?
    let forkCount: Int?
    let watcherCount: Int?
    let starCount: Int?
    let issuesCount: Int?
    let language: String?
    let repoDescription: String?
    let owner: RepoOwner?
    let repoUrl: String?

    enum CodingKeys: String, CodingKey {
        case name, language, owner
        case defaultBranch = "default_branch"
        case forkCount = "forks_count"
        case watcherCount = "watchers_count"
        case starCount = "startgazers_count"
        case issuesCount = "open_issues_count"
        case repoDescription = "description"
        case repoUrl = "html_url"
    }
}

// MARK: - RepoOwner
struct RepoOwner: Codable {
    let avatarUrl: String?
    let type: String?
    let name: String?
    //add email, maybe?
    enum CodingKeys: String, CodingKey {
        case avatarUrl = "avatar_url"
        case name = "login"
        case type
    }
}
