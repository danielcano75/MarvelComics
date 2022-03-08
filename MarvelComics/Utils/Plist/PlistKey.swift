//
//  PlistKey.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 3/03/22.
//

import Foundation

public enum PlistKey {
    case public_key
    case private_key
    case base_host
    case version_host
    case type_host
    case current_scheme_name
    case connection_protocol
    case timeout_interval
    
    var configValue: String? {
        switch self {
        case .public_key:
            return configDict["public_key"] as? String
        case .private_key:
            return configDict["private_key"] as? String
        case .base_host:
            return configDict["base_host"] as? String
        case .version_host:
            return configDict["version_host"] as? String
        case .type_host:
            return configDict["type_host"] as? String
        case .current_scheme_name:
            return configDict["current_scheme_name"] as? String
        case .connection_protocol:
            return configDict["protocol"] as? String
        case .timeout_interval:
            return configDict["timeout_interval"] as? String
        }
    }
    
    private var configDict: [String: Any] {
        if let dict = Bundle.main.object(forInfoDictionaryKey: "AppConfig") as? [String: String] {
            return dict
        } else {
            fatalError("Plist file not found")
        }
    }
}

