//
//  FilteredRepositoryList.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 18.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation

// MARK: - FilteredRepositoryList
struct FilteredRepositoryList: Codable {
    let totalCount: Int?
    let incompleteResults: Bool?
    let items: [Item]?

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}

// MARK: - Item
struct Item: Codable {
    let author: OwnerClass?
    let repository: Repository?

    enum CodingKeys: String, CodingKey {
        case author, repository
    }
}

// MARK: - OwnerClass
struct OwnerClass: Codable {
    let id: Int?
    let avatarURL: String?

    enum CodingKeys: String, CodingKey {
        case id
        case avatarURL = "avatar_url"
    }
}

// MARK: - Commit
struct Commit: Codable {
    let author, message: String?
    let comitter: CommitterClass

    enum CodingKeys: String, CodingKey {
        case author, message, comitter
    }
}

// MARK: - CommitterClass
struct CommitterClass: Codable {
    let date: Date?
    let name, email: String?
}

// MARK: - Repository
struct Repository: Codable {
    let id: Int?
    let name, fullName: String?
    let owner: OwnerClass?
    let repositoryDescription, url: String?

    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
        case repositoryDescription = "description"
        case id, name, owner, url
    }
}
