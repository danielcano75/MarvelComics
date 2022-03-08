//
//  View+Extension.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 7/03/22.
//

import UIKit

extension UIView {
    func round(corners: UIRectCorner,
               radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
