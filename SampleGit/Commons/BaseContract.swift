//
//  BaseContract.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 18.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

protocol IBaseView: class {
    func showProgressHUD()
    func hideProgressHUD()
    func showErrorDialog(with message: String)
}

extension UIViewController: IBaseView {
    func showProgressHUD() {
        LoadingManager.shared.showLoadingProgress()
    }

    func hideProgressHUD() {
        LoadingManager.shared.hideLoadingProgress()
    }

    func showErrorDialog(with message: String) {
        let alert = UIAlertController(title: "Warning", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)

    }
}

protocol IBasePresenter: class {
    func viewDidLoad()
}

protocol IBaseInteractorToPresenter: class {
    func wsErrorOccurred(with message: String)
}

protocol IBaseAdapter: class {
    func itemCount() -> Int
}
