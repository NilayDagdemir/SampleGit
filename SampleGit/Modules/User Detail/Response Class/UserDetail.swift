//
//  UserDetail.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 18.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation

struct UserDetail: Codable {
    let id: Int?
    let url: String?
    let avatarURL, gravatarID: String?
    let name, company: String?
    let location, email: String?
    let bio: String?
    let publicRepos: Int?

    enum CodingKeys: String, CodingKey {
        case id, url
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case name, company, location, email, bio
        case publicRepos = "public_repos"
    }
}
