//
//  Notification+Extension.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 9/03/22.
//

import Foundation

extension NotificationCenter {
    static let retry = NotificationCenter.default.publisher(for: .retry)
}

extension NSNotification.Name {
    static let retry = Notification.Name("Retry")
}
