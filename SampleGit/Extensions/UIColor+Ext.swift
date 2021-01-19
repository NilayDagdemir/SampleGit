//
//  UIColor+Ext.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 19.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

extension UIColor {
    static func defaultColor() -> UIColor {
        UIColor.white
    }

    static var brick: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: "brick") ?? defaultColor()
        } else {
            return UIColor(red: 204, green: 45, blue: 31, alpha: 1)
        }
    }

    static var frogGreen: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: "frog_green") ?? defaultColor()
        } else {
            return UIColor(red: 117, green: 175, blue: 10, alpha: 1)
        }
    }

    static var lightPeriwinkle: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: "light_periwinkle") ?? defaultColor()
        } else {
            return UIColor(red: 222, green: 227, blue: 237, alpha: 1)
        }
    }

    static var marine: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: "marine") ?? defaultColor()
        } else {
            return UIColor(red: 6, green: 56, blue: 108, alpha: 1)
        }
    }

    static var navy: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: "navy") ?? defaultColor()
        } else {
            return UIColor(red: 0, green: 26, blue: 55, alpha: 1)
        }
    }

    static var paleGrey: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: "pale_grey") ?? defaultColor()
        } else {
            return UIColor(red: 248, green: 249, blue: 251, alpha: 1)
        }
    }

    static var steelGrey: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: "steel_grey") ?? defaultColor()
        } else {
            return UIColor(red: 113, green: 125, blue: 141, alpha: 1)
        }
    }

    static var tealBlue: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: "teal_blue") ?? defaultColor()
        } else {
            return UIColor(red: 4, green: 158, blue: 173, alpha: 1)
        }
    }
}
