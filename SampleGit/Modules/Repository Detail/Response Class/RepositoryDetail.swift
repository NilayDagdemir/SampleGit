//
//  RepositoryDetail.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 18.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation
// repo name owner username avatar email fork count language default branch name
class RepositoryDetail: Codable {
    let id: Int?
    let name, fullName, welcomeDescription: String?
    let owner: Owner?
    let fork: Bool?
    let url, cloneURL, homepage: String?
    let language: String?
    let forksCount, size: Int?
    let defaultBranch: String?
    let openIssuesCount: Int
    let createdAt: Date?
    let forks, watchers, openIssues: Int?
    let license: License?
    let tempCloneToken: String?

    enum CodingKeys: String, CodingKey {
        case id, name, owner
        case fullName = "full_name"
        case welcomeDescription = "description"
        case fork, url, size, homepage, language
        case cloneURL = "clone_url"
        case forksCount = "forks_count"
        case defaultBranch = "default_branch"
        case openIssuesCount = "open_issues_count"
        case createdAt = "created_at"
        case forks, watchers, license
        case openIssues = "open_issues"
        case tempCloneToken = "temp_clone_token"
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
    let avatarURL, gravatarID: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case id, url
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
    }
}
