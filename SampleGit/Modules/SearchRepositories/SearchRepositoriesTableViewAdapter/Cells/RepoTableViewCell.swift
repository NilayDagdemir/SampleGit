//
//  RepoTableViewCell.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 19.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

class RepoTableViewCell: UITableViewCell {
    weak var delegate: RepoTableViewCellDelegate?
    @IBOutlet private weak var lblRepoTitle: UILabel!
    @IBOutlet private weak var lblOwnerName: UILabel!
    @IBOutlet private weak var ownerImageView: UIImageView! {
        didSet {
            let tap = UITapGestureRecognizer(target: self, action: .none)
            tap.cancelsTouchesInView = false
            ownerImageView.addGestureRecognizer(tap)
        }
    }

    private var repoItem: Repository?

    func setup(repoItem: Repository) {
        self.repoItem = repoItem
        lblRepoTitle.text = repoItem.name
        lblOwnerName.text = repoItem.owner?.name
        if let avatarURL = repoItem.owner?.avatarURL {
            ImageDownloadManager.shared.downloadOrGetCachedImageForImageView(url: avatarURL,
                                                                             imageView: ownerImageView)
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if delegate != nil {
            let touch = touches.first
            guard let location = touch?.location(in: self), let repoItem = repoItem else { return }
            if !ownerImageView.frame.contains(location) {
                delegate?.repoCardClicked(with: repoItem)
            } else {
                if let repoOwnerName = repoItem.owner?.name {
                    delegate?.avatarClicked(with: repoOwnerName)
                }
            }
        }
    }
}
