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
        let attributes: [NSAttributedString.Key : Any] = [
            .foregroundColor: UIColor.primary,
            .font: UIFont.marvel(size: .navigationTitle)
        ]
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .white
        appearance.titleTextAttributes = attributes
        appearance.largeTitleTextAttributes = attributes
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().tintColor = .primary
    }
}
