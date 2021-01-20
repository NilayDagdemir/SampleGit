//
//  RepositoryDetails.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 18.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation

class RepositoryDetails: Codable {
    let id, forksCount, size: Int?
    let name, fullName, welcomeDescription: String?
    let owner: Owner?
    let fork: Bool?
    let url, cloneURL, defaultBranch, homepage, language: String?
    let createdAt: Date?
    let openIssuesCount, forks, watchers, openIssues: Int?
    let license: License?

    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
        case welcomeDescription = "description"
        case cloneURL = "clone_url"
        case forksCount = "forks_count"
        case defaultBranch = "default_branch"
        case openIssuesCount = "open_issues_count"
        case createdAt = "created_at"
        case openIssues = "open_issues"
        case id, name, owner, fork, url, size, homepage, language, forks, watchers, license
    }
}

// MARK: - License
struct License: Codable {
    let key, name, url: String?

    enum CodingKeys: String, CodingKey {
        case key, name, url
    }
}

// MARK: - Owner
struct Owner: Codable {
    let id: Int?
    let url, avatarURL, gravatarID: String?

    enum CodingKeys: String, CodingKey {
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case id, url
    }
}
