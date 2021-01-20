//
//  RoundedCornerView.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 20.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedCornerView: UIView {

    private var corners: CACornerMask = []
    private var specialCorners: UIRectCorner = []
    @IBInspectable public var specialCornerValue: CGFloat = 0

    override func layoutSubviews() {
        self.layer.maskedCorners = [corners]
        DispatchQueue.main.async {
            self.setSpecialCorner()
        }
    }

    @IBInspectable public var topLeft: Bool {
        get {
            return corners.contains(.layerMinXMinYCorner)
        }
        set {
            setCorner(newValue: newValue, for: .layerMinXMinYCorner)
        }
    }

    @IBInspectable public var topLeftSpecial: Bool {
        get {
            return specialCorners.contains(.topLeft)
        }
        set {
            setSpecialCorner(newValue, for: .topLeft)
        }
    }

    @IBInspectable public var topRight: Bool {
        get {
            return corners.contains(.layerMaxXMinYCorner)
        }
        set {
            setCorner(newValue: newValue, for: .layerMaxXMinYCorner)
        }
    }

    @IBInspectable public var topRightSpecial: Bool {
        get {
            return specialCorners.contains(.topRight)
        }
        set {
            setSpecialCorner(newValue, for: .topRight)
        }
    }

    @IBInspectable public var bottomLeft: Bool {
        get {
            return corners.contains(.layerMinXMaxYCorner)
        }
        set {
            setCorner(newValue: newValue, for: .layerMinXMaxYCorner)
        }
    }

    @IBInspectable public var bottomLeftSpecial: Bool {
        get {
            return specialCorners.contains(.bottomLeft)
        }
        set {
            setSpecialCorner(newValue, for: .bottomLeft)
        }
    }

    @IBInspectable public var bottomRight: Bool {
        get {
            return corners.contains(.layerMaxXMaxYCorner)
        }
        set {
            setCorner(newValue: newValue, for: .layerMaxXMaxYCorner)
        }
    }

    @IBInspectable public var bottomRightSpecial: Bool {
        get {
            return specialCorners.contains(.bottomRight)
        }
        set {
            setSpecialCorner(newValue, for: .bottomRight)
        }
    }

    func setCorner(newValue: Bool, for corner: CACornerMask) {
        if newValue {
            addRectCorner(corner: corner)
        } else {
            removeRectCorner(corner: corner)
        }
    }

    func addRectCorner(corner: CACornerMask) {
        corners.insert(corner)
    }

    func removeRectCorner(corner: CACornerMask) {
        if corners.contains(corner) {
            corners.remove(corner)
        }
    }

    func setSpecialCorner(_ newValue: Bool, for corner: UIRectCorner) {
        if newValue {
            specialCorners.insert(corner)
        } else {
            removeSpecialCorner(corner: corner)
        }
    }

    func removeSpecialCorner(corner: UIRectCorner) {
        if specialCorners.contains(corner) {
            specialCorners.remove(corner)
        }
    }

    func setSpecialCorner() {
        if !specialCorners.isEmpty {
            let maskPath = UIBezierPath(roundedRect: self.bounds,
                                        byRoundingCorners: specialCorners,
                                        cornerRadii: CGSize(width: specialCornerValue, height: 0.0))

            let maskLayer = CAShapeLayer()
            maskLayer.path = maskPath.cgPath
            self.layer.mask = maskLayer
        }
    }
}
