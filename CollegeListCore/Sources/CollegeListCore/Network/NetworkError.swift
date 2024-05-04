//
//  NetworkError.swift
//  CollegeList
//
//  Created by Ali Elsokary on 03/05/2024.
//

import Foundation

public enum NetworkError: Error {
    case internalServerError
    case clientErrors
    case parsingError
    case unknownError
    case notFound
    case noInternet
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .noInternet:
            return "The Internet connection appears to be offline."
        case .internalServerError:
            return "Internal Server error"
        case .clientErrors:
            return "Client error responses"
        case .parsingError:
            return "Error parsing the request"
        case .unknownError:
            return "Something went wrong, please try again later"
        case .notFound:
            return "We cannot find this page, please try again"
        }
    }
}
