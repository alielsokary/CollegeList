//
//  CollegeListRouter.swift
//  CollegeList
//
//  Created by Ali Elsokary on 03/05/2024.
//

import UIKit

protocol CollegeListRouter: AnyObject {
    func start() -> UIViewController 
    func navigateToCollegeDetails(with viewModel: CollegeViewModel)
}

final class CollegeListRouterImpl: CollegeListRouter {

    weak var viewController: UIViewController?
    
    func start() -> UIViewController {
        let viewController = CollegeListBuilder.build()
        return viewController
    }

    func navigateToCollegeDetails(with viewModel: CollegeViewModel) {
        let storyboard = UIStoryboard(name: "CollegeDetails", bundle: nil)
        let interactor = CollegeDetailsInteractor(viewModel: viewModel)
        let presenter = CollegeDetailsPresenterImpl(interactor: interactor)
        let vc = storyboard.instantiateViewController(identifier: "CollegeDetailsViewController") { coder in
            return CollegeDetailsViewController(coder: coder, presenter: presenter)
        }
        vc.modalPresentationStyle = .fullScreen
        viewController?.present(vc, animated: true)
    }
}
