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
    @IBOutlet private weak var ownerAvatarImageView: UIImageView! {
        didSet {
            let tap = UITapGestureRecognizer(target: self, action: #selector(avatarTapped))
            tap.cancelsTouchesInView = false
            ownerAvatarImageView.addGestureRecognizer(tap)
        }
    }

    @IBOutlet private weak var repoDetailView: UIView!
    @IBOutlet private weak var lblRepoName: UILabel!
    @IBOutlet private weak var lblLanguage: UILabel!
    @IBOutlet private weak var lblDefaultBranchName: UILabel!
    @IBOutlet private weak var lblRepoURL: UILabel!
    @IBOutlet private weak var repoDescriptionTextView: UITextView!

    @IBOutlet private weak var lblWatcherCount: UILabel!
    @IBOutlet private weak var lblStarCount: UILabel!
    @IBOutlet private  weak var lblForkCount: UILabel!

    // MARK: Properties
    var presenter: IRepositoryDetailPresenter?

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        title = Constants.RepositoryDetail.navBarTitle
        addTapGestureRecognizerToLink()
    }

    private func setOwnerCard(with ownerItem: RepoOwner) {
        lblOwnerName.text = ownerItem.name
        lblOwnerType.text = Constants.RepositoryDetail.ownerTypePrefix +
                            "\(ownerItem.type ?? Constants.Error.noOverviewTextExists)"
        if let avatarURL = ownerItem.avatarURL {
            ImageDownloadManager.shared.downloadOrGetCachedImageForImageView(url: avatarURL,
                                                                             imageView: ownerAvatarImageView)
        }
    }

    private func setRepoDetailCard(with repoItem: Repository) {
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

    private func addTapGestureRecognizerToLink() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(repoURLTapped))
        lblRepoURL.addGestureRecognizer(tapRecognizer)
    }

    @objc private func repoURLTapped() {
        if let repoURL = lblRepoURL.text {
            presenter?.repoURLTapped(with: repoURL)
        }
    }

    @objc private func avatarTapped() {
        presenter?.avatarClicked()
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
