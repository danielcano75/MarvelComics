//
//  Environment.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 3/03/22.
//

import Foundation

enum QueryItemKeys: String {
    case timestamp = "ts"
    case api_key = "apikey"
    case hash = "hash"
    
    var value: String {
        return rawValue
    }
}

public struct Environment {
    static let shared = Environment()
    
    public func configuration(_ key: PlistKey) -> String? {
        return key.configValue
    }
    
    public func urlComponents(endpoint: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = configuration(.connection_protocol)
        components.host = configuration(.base_host)
        components.path = endpoint
        components.queryItems = queryItems()
        return components
    }
    
    public func environmentName() -> String? {
        return PlistKey.current_scheme_name.configValue
    }
    
    private func queryItems() -> [URLQueryItem] {
        let timestamp = "\(Int64(Date().timeIntervalSince1970))"
        let privateKey = configuration(.private_key) ?? ""
        let publicKey = configuration(.public_key) ?? ""
        let hash = timestamp + privateKey + publicKey
        let items: [URLQueryItem] = [
            .init(name: QueryItemKeys.timestamp.value, value: timestamp),
            .init(name: QueryItemKeys.api_key.value, value: configuration(.public_key)),
            .init(name: QueryItemKeys.hash.value, value: hash.MD5)
        ]
        return items
    }
}
