//
//  Config.swift
//  CollegeList
//
//  Created by Ali Elsokary on 03/05/2024.
//

import Foundation

struct Config {
    static let baseURL: String = "http://universities.hipolabs.com"
    struct EndpointPath {
        static let search = "/search?country=United%20Arab%20Emirates"
    }
}
enum HTTPHeaderField: String {
    case contentType = "Content-Type"
}

enum ContentType: String {
    case json = "application/json"
}
