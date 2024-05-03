//
//  CollegeListService.swift
//  CollegeList
//
//  Created by Ali Elsokary on 03/05/2024.
//

import Foundation

protocol CollegeListService {
    func getCollegeList(completion: @escaping (Result<[College], NetworkError>) -> Void)
}

class CollegeListServiceImpl: CollegeListService {
    private let service = NetworkService()

    func getCollegeList(completion: @escaping (Result<[College], NetworkError>) -> Void) {
        return service.fetchRequest(forRoute: .getColleges, completion: completion)
    }

}
