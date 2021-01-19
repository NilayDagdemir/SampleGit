//
//  String+Ext.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 19.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

extension String {
    func isValidURL() -> Bool {
        if let url = URL(string: self), UIApplication.shared.canOpenURL(url) {
            return true
        }
        return false
    }
}
