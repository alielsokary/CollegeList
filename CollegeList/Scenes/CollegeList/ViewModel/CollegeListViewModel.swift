//
//  CollegeListViewModel.swift
//  CollegeList
//
//  Created by Ali Elsokary on 03/05/2024.
//

import Foundation

protocol CollegeListViewModelLogic {
    var colleges: [CollegeViewModel] { get set }
    func getCollegeList()
}

class CollegeListViewModel: CollegeListViewModelLogic {
    var colleges: [CollegeViewModel] = []
    
    weak var delegate: CollegeListViewControllerDisplayLogic?
    
    private let repository: CollegeRepository
    
    init(repository: CollegeRepository = CollegeRepositoryImpl()) {
        self.repository = repository
    }
    
    func getCollegeList() {
        repository.fetchColleges { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let colleges):
                self.colleges = colleges
                self.delegate?.reloadData()
            case .failure(let error):
                print(error)
                self.delegate?.showAlert(text: error.localizedDescription)
            }
        }
    }
}
