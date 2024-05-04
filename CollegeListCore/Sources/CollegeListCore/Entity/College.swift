//
//  College.swift
//  CollegeList
//
//  Created by Ali Elsokary on 03/05/2024.
//

import Foundation

// MARK: - College
public struct College: Codable {
    public let domains: [String]?
    public let stateProvince: String?
    public let name: String?
    public let webPages: [String]?
    public let country: String?
    public let alphaTwoCode: String?

    enum CodingKeys: String, CodingKey {
        case domains
        case stateProvince = "state-province"
        case name
        case webPages = "web_pages"
        case country
        case alphaTwoCode = "alpha_two_code"
    }
}
