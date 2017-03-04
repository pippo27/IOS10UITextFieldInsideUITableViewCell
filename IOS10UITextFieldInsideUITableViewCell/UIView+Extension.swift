//
//  UIView+Extension.swift
//  IOS10UITextFieldInsideUITableViewCell
//
//  Created by Arthit Thongpan on 3/4/17.
//  Copyright © 2017 Arthit Thongpan. All rights reserved.
//

import UIKit

extension UIView {
    
    func round(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func showShadow() {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize.zero
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shadowRadius = 5.0
        
        //For optimizing your pictures quality you should add also the rasterizationScale if you activated "shouldRasterize":
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
}
