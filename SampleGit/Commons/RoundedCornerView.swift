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

    @IBInspectable var topLeftCorner : CGFloat = 0{
        didSet{
            self.applyMask()
        }
    }
    @IBInspectable var topRightCorner : CGFloat = 0{
        didSet{
            self.applyMask()
        }
    }
    @IBInspectable var bottomRightCorner : CGFloat = 0{
        didSet{
            self.applyMask()
        }
    }

    @IBInspectable var bottomLeftCorner : CGFloat = 0{
        didSet{
            self.applyMask()
        }
    }

    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.applyMask()
    }


    func applyMask() {
        let shapeLayer = CAShapeLayer(layer: self.layer)
        shapeLayer.path = self.pathForCornersRounded(rect:self.bounds).cgPath
        shapeLayer.frame = self.bounds
        shapeLayer.masksToBounds = true
        self.layer.mask = shapeLayer
    }

    func pathForCornersRounded(rect:CGRect) ->UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0 + topLeftCorner , y: 0))
        path.addLine(to: CGPoint(x: rect.size.width - topRightCorner , y: 0))
        path.addQuadCurve(to: CGPoint(x: rect.size.width , y: topRightCorner), controlPoint: CGPoint(x: rect.size.width, y: 0))
        path.addLine(to: CGPoint(x: rect.size.width , y: rect.size.height - bottomRightCorner))
        path.addQuadCurve(to: CGPoint(x: rect.size.width - bottomRightCorner , y: rect.size.height), controlPoint: CGPoint(x: rect.size.width, y: rect.size.height))
        path.addLine(to: CGPoint(x: bottomLeftCorner , y: rect.size.height))
        path.addQuadCurve(to: CGPoint(x: 0 , y: rect.size.height - bottomLeftCorner), controlPoint: CGPoint(x: 0, y: rect.size.height))
        path.addLine(to: CGPoint(x: 0 , y: topLeftCorner))
        path.addQuadCurve(to: CGPoint(x: 0 + topLeftCorner , y: 0), controlPoint: CGPoint(x: 0, y: 0))
        path.close()

        return path
    }
}
