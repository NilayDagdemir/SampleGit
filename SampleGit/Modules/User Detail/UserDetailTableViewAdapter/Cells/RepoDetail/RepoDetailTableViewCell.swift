//
//  RepoDetailTableViewCell.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 20.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

protocol RepoDetailTableViewCellDelegate: class {
    func repoURLTapped(with repoURL: String)
}

class RepoDetailTableViewCell: UITableViewCell {
    weak var delegate: RepoDetailTableViewCellDelegate?

    @IBOutlet private weak var lblRepoName: UILabel!
    @IBOutlet private weak var lblLanguage: UILabel!
    @IBOutlet private weak var lblDefaultBranchName: UILabel!
    @IBOutlet private weak var lblRepoURL: UnderlinedLabel! {
        didSet {
            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(repoURLTapped))
            lblRepoURL.addGestureRecognizer(tapRecognizer)
        }
    }

    @IBOutlet private weak var repoDescriptionTextView: UITextView!
    @IBOutlet private weak var lblWatcherCount: UILabel!
    @IBOutlet private weak var lblStarCount: UILabel!
    @IBOutlet private weak var lblForkCount: UILabel!

    func setup(repoItem: Repository) {
        lblRepoName.text = repoItem.name
        lblLanguage.text = repoItem.language
        lblDefaultBranchName.text = Constants.RepositoryDetail.branchNamePrefix +
                                    "\(repoItem.defaultBranch ?? Constants.Error.noOverviewTextExists)"
        lblRepoURL.text = "\(repoItem.repoUrl ?? Constants.Error.noOverviewTextExists)"
        repoDescriptionTextView.text = "\(repoItem.repoDescription ?? Constants.Error.noOverviewTextExists)"

        lblWatcherCount.text = "\(repoItem.watcherCount ?? 0)"
        lblStarCount.text = "\(repoItem.starCount ?? 0)"
        lblForkCount.text = "\(repoItem.forkCount ?? 0)"
    }

    @objc private func repoURLTapped() {
        if let repoURL = lblRepoURL.text {
            delegate?.repoURLTapped(with: repoURL)
        }
    }
}
