//
//  CollegeDetailsPresenter.swift
//  CollegeList
//
//  Created by Ali Elsokary on 03/05/2024.
//

import Foundation

public protocol CollegeDetailsPresenter {
    func viewDidLoad(view: CollegeDetailsView)
    func startDataRefresh()
}

public class CollegeDetailsPresenterImpl: CollegeDetailsPresenter {
    private weak var view: CollegeDetailsView?

    private let interactor: CollegeDetailsInteractorLogic
    
    public init(interactor: CollegeDetailsInteractorLogic) {
        self.interactor = interactor
    }
    
    public func viewDidLoad(view: CollegeDetailsView) {
        self.view = view
        view.displayData(viewModel: interactor.viewModel)
    }
    
    public func startDataRefresh() {
        NotificationCenter.default.post(name: Notification.Name("collegeDataRefreshed"), object: nil)
    }
}
