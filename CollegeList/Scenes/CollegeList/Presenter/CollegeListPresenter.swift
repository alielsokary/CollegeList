//
//  CollegeListPresenter.swift
//  CollegeList
//
//  Created by Ali Elsokary on 03/05/2024.
//

import Foundation

protocol CollegeListPresenter {
    func viewDidLoad(view: CollegeListView)
    func numberOfColleges() -> Int
    func collegeViewModel(at index: Int) -> CollegeViewModel
    func didSelectCollege(at index: Int)
}

class CollegeListPresenterImpl: CollegeListPresenter {
    private weak var view: CollegeListView?
    
    private let router: CollegeListRouter
    
    private let interactor: CollegeListInteractorLogic
    
    init(router: CollegeListRouter, interactor: CollegeListInteractorLogic) {
        self.router = router
        self.interactor = interactor
    }
    
    func viewDidLoad(view: CollegeListView) {
        self.view = view
        interactor.getCollegeList()
    }
    
    func numberOfColleges() -> Int {
        return interactor.colleges.count
    }
    
    func collegeViewModel(at index: Int) -> CollegeViewModel {
        return interactor.colleges[index]
    }
    
    func didSelectCollege(at index: Int) {
        let selectedCollege = interactor.colleges[index]
        router.navigateToCollegeDetails(with: selectedCollege)
    }
}

extension CollegeListPresenterImpl: CollegeListInteractorOutput {
    func reloadData() {
        view?.reloadData()
    }
    
    func showAlert(text: String) {
        view?.showAlert(text: text)
    }
}
