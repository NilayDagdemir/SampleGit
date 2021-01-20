//
//  UIApplication+Ext.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 20.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

extension UIApplication {
    func openUrl(_ urlLink: String) {
        if let url = URL(string: urlLink), UIApplication.shared.canOpenURL(url) {
            open(url, options: [:], completionHandler: nil)
        } else {
            keyWindow?.rootViewController?.showErrorDialog(with: Constants.Error.invalidURL)
        }
    }
}
