//
//  String+Extension.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 3/03/22.
//

import Foundation
import CryptoKit

extension String {
    var MD5: String {
        guard let data = data(using: .utf8) else {
            return ""
        }
        let computed = Insecure.MD5.hash(data: data)
        return computed.map { String(format: "%02hhx", $0) }.joined()
    }
}
