//
//  UserDetailViewController.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 20.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation
import UIKit

class UserDetailViewController: BaseViewController, StoryboardLoadable {

    @IBOutlet weak var userDetailTableView: UITableView!

    // MARK: Properties
    var presenter: IUserDetailPresenter?

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension UserDetailViewController: IUserDetailView {
    // TODO: implement view output methods
}
