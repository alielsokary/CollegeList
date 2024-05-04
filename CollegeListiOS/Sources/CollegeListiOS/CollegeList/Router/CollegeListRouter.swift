//
//  CollegeListRouter.swift
//  CollegeList
//
//  Created by Ali Elsokary on 03/05/2024.
//

import UIKit
import CollegeListCore
import CollegeDetailsiOS

public protocol CollegeListRouter: AnyObject {
    func start() -> UIViewController
    func navigateToCollegeDetails(with viewModel: CollegeViewModel)
}

public final class CollegeListRouterImpl: CollegeListRouter {

    weak var viewController: UIViewController?
    
    public init(viewController: UIViewController? = nil) {
        self.viewController = viewController
    }
    
    let detailsRouter = CollegeDetailsRouterImpl()
    
    public func start() -> UIViewController {
        let viewController = CollegeListBuilder.build()
        return viewController
    }

    public func navigateToCollegeDetails(with viewModel: CollegeViewModel) {
        if let vc = viewController {
            detailsRouter.start(with: viewModel, for: vc)
        }
    }
}
