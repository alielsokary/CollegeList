//
//  NetworkService.swift
//  CollegeList
//
//  Created by Ali Elsokary on 03/05/2024.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchRequest<T: Decodable>(forRoute route: CollegesRouter, completion: @escaping(Result<T, NetworkError>) -> Void)
}

class NetworkService: NetworkServiceProtocol {

    func fetchRequest<T>(forRoute route: CollegesRouter,
                         completion: @escaping (Result<T, NetworkError>) -> Void) where T: Decodable {
        do {
            let urlRequest = try route.asURLRequest()
            URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
                DispatchQueue.main.async {
                    if let data = data, let utf8Text = String(data: data, encoding: .utf8) {
                    }
                    if let httpResponse = response as? HTTPURLResponse,
                       !(200 ... 299).contains(httpResponse.statusCode) {
                    let txtError = self.handleError(forCode: httpResponse.statusCode)
                        return
                    }
                    guard let data = data else {
                        completion(.failure(.parsingError))
                        return
                    }
                    do {
                        let reviews = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(reviews))
                    } catch {
                        completion(.failure(.parsingError))
                    }
                }
            }).resume()
        } catch {
            completion(.failure(.unknownError))
        }
    }

    private func handleError(forCode code: Int) -> NetworkError {
        switch code {
        case 500...599:
        return .internalServerError
        case 400 ... 499:
        return .clientErrors
        default:
        return .unknownError
        }
    }

}
