//
//  ViewGradientExtension.swift
//  KoreBank
//
//  Created by Prudhvi Gadiraju on 2/24/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func addGradient(color1: UIColor, color2: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [color1.cgColor, color2.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
