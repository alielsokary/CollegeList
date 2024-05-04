//
//  CollegeListService.swift
//  CollegeList
//
//  Created by Ali Elsokary on 03/05/2024.
//

import Foundation

public protocol CollegeListService {
    func getCollegeList(completion: @escaping (Result<[College], NetworkError>) -> Void)
}

public class CollegeListServiceImpl: CollegeListService {
    private let service = NetworkService()
    public init() { }
    public func getCollegeList(completion: @escaping (Result<[College], NetworkError>) -> Void) {
        return service.fetchRequest(forRoute: .getColleges, completion: completion)
    }

}
