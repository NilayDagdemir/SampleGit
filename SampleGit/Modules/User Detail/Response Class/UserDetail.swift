//
//  UserDetail.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 18.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation

struct UserDetail: Codable {
    let name, bio, company, location, email, avatarURL: String?

    enum CodingKeys: String, CodingKey {
        case avatarURL = "avatar_url"
        case name, bio, company, location, email
    }
}
