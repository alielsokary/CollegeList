//
//  CollegeListInteractor.swift
//  CollegeList
//
//  Created by Ali Elsokary on 03/05/2024.
//

import Foundation

protocol CollegeListInteractorLogic {
    var colleges: [CollegeViewModel] { get set }
    func getCollegeList()
}

protocol CollegeListInteractorOutput: AnyObject {
    func reloadData()
    func showAlert(text: String)
}

class CollegeListInteractor: CollegeListInteractorLogic {
    
    weak var output: CollegeListInteractorOutput?
    
    var colleges: [CollegeViewModel] = []
    
    private let repository: CollegeRepository
    
    init(repository: CollegeRepository) {
        self.repository = repository
    }
    
    func getCollegeList() {
        repository.fetchColleges { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let colleges):
                self.colleges = colleges
                self.output?.reloadData()
            case .failure(let error):
                print(error)
                self.output?.showAlert(text: error.localizedDescription)
            }
        }
    }
}
