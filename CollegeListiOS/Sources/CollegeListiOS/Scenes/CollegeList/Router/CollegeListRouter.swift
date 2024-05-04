//
//  CollegeListRouter.swift
//  CollegeList
//
//  Created by Ali Elsokary on 03/05/2024.
//

import UIKit
import CollegeListCore

public protocol CollegeListRouter: AnyObject {
    func start() -> UIViewController
    func navigateToCollegeDetails(with viewModel: CollegeViewModel)
}

public final class CollegeListRouterImpl: CollegeListRouter {

    weak var viewController: UIViewController?
    
    public init(viewController: UIViewController? = nil) {
        self.viewController = viewController
    }
    
    public func start() -> UIViewController {
        let viewController = CollegeListBuilder.build()
        return viewController
    }

    public func navigateToCollegeDetails(with viewModel: CollegeViewModel) {
        let storyboard = UIStoryboard(name: "CollegeDetails", bundle: Bundle.module)
        let interactor = CollegeDetailsInteractor(viewModel: viewModel)
        let presenter = CollegeDetailsPresenterImpl(interactor: interactor)
        var vc = UIViewController()
        
        if #available(iOS 13.0, *) {
            vc = storyboard.instantiateViewController(identifier: "CollegeDetailsViewController") { coder in
                return CollegeDetailsViewController(coder: coder, presenter: presenter)
            }
        } else {
        }
        vc.modalPresentationStyle = .fullScreen
        viewController?.present(vc, animated: true)
    }
}
