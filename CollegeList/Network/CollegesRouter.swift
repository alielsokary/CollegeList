//
//  CollegesRouter.swift
//  CollegeList
//
//  Created by Ali Elsokary on 03/05/2024.
//

import Foundation
enum CollegesRouter {

    // MARK: - Endpoints
    case getColleges

    // MARK: - Properties
    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }

    var path: String {
        switch self {
        case .getColleges:
            return Config.EndpointPath.search

        }
    }

    var parameters: [String: Any]? {
        switch self {
        default:
            return nil
        }
    }

    // MARK: - Methods
    func asURLRequest() throws -> URLRequest {
        let endpointPath: String = "\(Config.baseURL)\(path)"
        var components = URLComponents(string: endpointPath)
        var urlRequest = URLRequest(url: (components?.url)!)
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        urlRequest.url = components?.url

        return urlRequest
    }
}
