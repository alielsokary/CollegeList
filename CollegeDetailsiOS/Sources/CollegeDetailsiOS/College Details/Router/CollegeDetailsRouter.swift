//
//  CollegeDetailsRouter.swift
//  CollegeList
//
//  Created by Ali Elsokary on 04/05/2024.
//

import UIKit
import CollegeListCore

public protocol CollegeDetailsRouter: AnyObject {
    func start(with viewModel: CollegeViewModel, for viewController: UIViewController)
}

public final class CollegeDetailsRouterImpl: CollegeDetailsRouter {

    weak var viewController: UIViewController?
    
    public init(viewController: UIViewController? = nil) {
        self.viewController = viewController
    }
    
    public func start(with viewModel: CollegeViewModel, for viewController: UIViewController) {
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
        viewController.present(vc, animated: true)
    }
}
