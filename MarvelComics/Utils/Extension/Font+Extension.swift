//
//  Font+Extension.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 4/03/22.
//

import UIKit

enum DecorationType: String {
    case marvel = "Marvel-Regular"
    
    var value: String {
        rawValue
    }
}

enum FontSizeType: CGFloat {
    case navigationLargeTitle = 34.0
    case navigationTitle = 24.0
    case title = 17.0
    case text = 14.0
    
    var value: CGFloat {
        rawValue
    }
}

extension UIFont {
    static func marvel(decorator: DecorationType = .marvel,
                       size: FontSizeType = .text) -> UIFont {
        guard let marvel = UIFont(name: decorator.value, size: size.value) else {
            return .systemFont(ofSize: size.value)
        }
        return marvel
    }
}
