//
//  CardViewBase.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 21.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

@IBDesignable
class CardViewBase: RoundedCornerView {

    override public func layoutSubviews() {
        super.layoutSubviews()
        updateCorners()
        updateBorders()
    }

    fileprivate func updateCorners() {
        self.topLeft = true
        self.topRight = true
        self.bottomRight = true
        self.bottomLeft = true
        self.cornerRadius = 4
    }

    fileprivate func updateBorders() {
        self.borderColor = .lightPeriwinkle
        self.borderWidth = 1
    }
}
