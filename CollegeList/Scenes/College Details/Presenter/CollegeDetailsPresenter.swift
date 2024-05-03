//
//  CollegeDetailsPresenter.swift
//  CollegeList
//
//  Created by Ali Elsokary on 03/05/2024.
//

import Foundation

protocol CollegeDetailsPresenter {
    func viewDidLoad(view: CollegeDetailsView)
}

class CollegeDetailsPresenterImpl: CollegeDetailsPresenter {
    private weak var view: CollegeDetailsView?

    private let interactor: CollegeDetailsInteractorLogic
    
    init(interactor: CollegeDetailsInteractorLogic) {
        self.interactor = interactor
    }
    
    func viewDidLoad(view: CollegeDetailsView) {
        self.view = view
        view.displayData(viewModel: interactor.viewModel)
    }
}
