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
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let collegeDetailsVC = storyboard.instantiateViewController(withIdentifier: "CollegeDetailsViewController") as? CollegeDetailsViewController {
            collegeDetailsVC.interactor.college = viewModel
            viewController?.present(collegeDetailsVC, animated: true)
        }
    }
}
