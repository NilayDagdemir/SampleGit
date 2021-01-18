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
    let url, avatarURL, gravatarID: String?
    let name, bio, company, location, email: String?
    let publicRepos: Int?

    enum CodingKeys: String, CodingKey {
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case publicRepos = "public_repos"
        case id, name, url, company, location, email, bio
    }
}
