//
//  College.swift
//  CollegeList
//
//  Created by Ali Elsokary on 03/05/2024.
//

import Foundation

// MARK: - College
struct College: Codable {
    let domains: [String]?
    let stateProvince: String?
    let name: String?
    let webPages: [String]?
    let country: String?
    let alphaTwoCode: String?

    enum CodingKeys: String, CodingKey {
        case domains
        case stateProvince = "state-province"
        case name
        case webPages = "web_pages"
        case country
        case alphaTwoCode = "alpha_two_code"
    }
}
