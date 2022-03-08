//
//  Device+Extension.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 8/03/22.
//

import UIKit

extension UIDevice {
    var notchSize: CGFloat {
        let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        return keyWindow?.safeAreaInsets.bottom ?? .zero
    }
}
