//
//  CollegeListViewModel.swift
//  CollegeList
//
//  Created by Ali Elsokary on 03/05/2024.
//

import Foundation

protocol CollegeListViewModelLogic {
    var collegeListViewModels: [CollegeViewModel] { get set }
    func getCollegeList()
}

class CollegeListViewModel: CollegeListViewModelLogic {
    var collegeListViewModels: [CollegeViewModel] = []
    
    weak var delegate: CollegeListViewControllerDisplayLogic?

    private let apiService: CollegeListService
    init(apiService: CollegeListService = CollegeListServiceImpl()) {
        self.apiService = apiService
    }
    
    
    func getCollegeList() {
        apiService.getCollegeList { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let collegeList):
                _ = collegeList.map { college in
                    let collegeVM = CollegeViewModel(college: college)
                    self.collegeListViewModels.append(collegeVM)
                    self.delegate?.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
