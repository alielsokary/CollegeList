//
//  CollegeRepository.swift
//  CollegeList
//
//  Created by Ali Elsokary on 03/05/2024.
//

public protocol CollegeRepository {
    typealias Completion = (Result<[CollegeViewModel], Error>) -> Void

    func fetchColleges(completion: @escaping Completion)
}

public class CollegeRepositoryImpl: CollegeRepository {
    private let apiService: CollegeListService
    private let storageService: CollegeStorageService

    public init(apiService: CollegeListService, storageService: CollegeStorageService) {
        self.apiService = apiService
        self.storageService = storageService
    }

    public func fetchColleges(completion: @escaping Completion) {
        apiService.getCollegeList { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let collegeList):
                var colleges: [CollegeViewModel] = []
                _ = collegeList.map { college in
                    let collegeVM = CollegeViewModel(college: college)
                    self.storageService.save(college: collegeVM)
                    colleges.append(collegeVM)
                }
                completion(.success(colleges))
                
            case .failure(let error):
                print(error)
                let colleges = self.storageService.fetchColleges()
                if !colleges.isEmpty {
                    completion(.success(colleges))
                } else {
                    completion(.failure(error))
                }
            }
        }
    }
}

