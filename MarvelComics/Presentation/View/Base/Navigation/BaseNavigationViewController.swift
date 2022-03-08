//
//  BaseNavigationViewController.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 4/03/22.
//

import UIKit

class BaseNavigationViewController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        build()
    }
    
    private func build() {
        let standartAttributes: [NSAttributedString.Key : Any] = [
            .foregroundColor: UIColor.primary,
            .font: UIFont.marvel(size: .navigationTitle)
        ]
        
        let largeAttributes: [NSAttributedString.Key : Any] = [
            .foregroundColor: UIColor.primary,
            .font: UIFont.marvel(size: .navigationLargeTitle)
        ]
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .secondary
        appearance.titleTextAttributes = standartAttributes
        appearance.largeTitleTextAttributes = largeAttributes
        
        navigationBar.prefersLargeTitles = true
        navigationBar.standardAppearance = appearance
        navigationBar.compactAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
        navigationBar.tintColor = .primary
        if #available(iOS 15.0, *) {
            navigationBar.compactScrollEdgeAppearance = appearance
        } else {
            // Fallback on earlier versions
        }
    }
}
