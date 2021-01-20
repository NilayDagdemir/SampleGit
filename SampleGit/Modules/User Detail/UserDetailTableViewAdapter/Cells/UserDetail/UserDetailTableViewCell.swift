//
//  UserDetailTableViewCell.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 20.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

class UserDetailTableViewCell: UITableViewCell {

    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var lblName: UILabel!
    @IBOutlet private weak var lblEmail: UILabel!
    @IBOutlet private weak var lblCompany: UILabel!
    @IBOutlet private weak var userBioTextView: UITextView!

    private var userDetail: UserDetail?

    func setup(userItem: UserDetail) {
        self.userDetail = userItem
        lblName.text = userItem.name?.isEmpty ?? true ? Constants.Error.noOverviewTextExists: userItem.name
        lblEmail.text = userItem.email?.isEmpty ?? true ? Constants.Error.noOverviewTextExists: userItem.email
        lblCompany.text = userItem.company?.isEmpty ?? true ? Constants.Error.noOverviewTextExists: userItem.company
        userBioTextView.text = userItem.bio?.isEmpty ?? true ? Constants.Error.noOverviewTextExists: userItem.bio
        if let avatarURL = userItem.avatarURL {
            ImageDownloadManager.shared.downloadOrGetCachedImageForImageView(url: avatarURL,
                                                                             imageView: avatarImageView)
        }
    }
}
