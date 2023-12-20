//
//  NetworkingError.swift
//  Hotel
//
//  Created by Timur Kadiev on 20.12.2023.
//

import Foundation

enum NetworkingError: LocalizedError {
    case badURlResponse(url: URL)
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .badURlResponse(url: let url):
            return "Bad response from URL: \(url)"
        case .unknown:
            return "Unknown error occurred"
        }
    }
}
