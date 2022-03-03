//
//  APIEndpoint.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 3/03/22.
//

public enum APIEndpoint: String {
    case characters = "/characters"
    
    var value: String {
        return rawValue
    }
}
