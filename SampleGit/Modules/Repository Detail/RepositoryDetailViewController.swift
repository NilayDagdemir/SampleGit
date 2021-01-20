//
//  RepositoryDetailViewController.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 20.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation
import UIKit

class RepositoryDetailViewController: BaseViewController, StoryboardLoadable {

    @IBOutlet private weak var userCardView: UIView!
    @IBOutlet private weak var lblOwnerName: UILabel!
    @IBOutlet private weak var lblOwnerType: UILabel!
    @IBOutlet private weak var ownerAvatarImageView: UIImageView!

    @IBOutlet private weak var repoDetailView: UIView!
    @IBOutlet private weak var lblRepoName: UILabel!
    @IBOutlet private weak var lblLanguage: UILabel!
    @IBOutlet private weak var lblDefaultBranchName: UILabel!
    @IBOutlet private weak var lblRepoURL: UILabel!
    @IBOutlet private weak var repoDescriptionTextView: UITextView!

    @IBOutlet private weak var lblWatcherCount: UILabel!
    @IBOutlet private weak var lblStarCount: UILabel!
    @IBOutlet private weak var lblForkCount: UILabel!


    // MARK: Properties
    var presenter: IRepositoryDetailPresenter?

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        userCardView.addShadow()
        repoDetailView.addShadow()
    }

    private func setOwnerCard(with ownerItem: RepoOwner) {
        lblOwnerName.text = ownerItem.name
        lblOwnerType.text = ownerItem.type
        if let avatarURL = ownerItem.avatarUrl {
            ImageDownloadManager.shared.downloadOrGetCachedImageForImageView(url: avatarURL,
                                                                             imageView: ownerAvatarImageView)
        }
    }

    private func setRepoDetailCard(with repoItem: Repository) {
        lblRepoName.text = repoItem.name
        lblLanguage.text = repoItem.language
        lblDefaultBranchName.text = Constants.RepositoryDetail.branchNamePrefix + "\(repoItem.defaultBranch ?? Constants.Error.noOverviewTextExists)"
        lblRepoURL.text = Constants.RepositoryDetail.repoURLPrefix + "\(repoItem.repoUrl ?? Constants.Error.noOverviewTextExists)"
        print("here url is: \(repoItem.repoUrl ?? Constants.Error.noOverviewTextExists)")
        repoDescriptionTextView.text = repoItem.repoDescription
        lblWatcherCount.text = "\(repoItem.watcherCount ?? 0)"
        lblStarCount.text = "\(repoItem.starCount ?? 0)"
        lblForkCount.text = "\(repoItem.forkCount ?? 0)"
    }
}

extension RepositoryDetailViewController: IRepositoryDetailView {
    func setUIElements() {
        let repoDetailItem = presenter?.getRepoDetailItem()
        if let repoOwner = repoDetailItem?.owner, let repoDetailItem = repoDetailItem {
            setOwnerCard(with: repoOwner)
            setRepoDetailCard(with: repoDetailItem)
        }
    }
}
