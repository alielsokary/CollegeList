//
//  CollegeListBuilder.swift
//  CollegeList
//
//  Created by Ali Elsokary on 03/05/2024.
//

import UIKit
import CollegeListCore

final class CollegeListBuilder {
    
    static func build() -> UIViewController {
        let router = CollegeListRouterImpl()
        let apiService = CollegeListServiceImpl()
        let storageService = CollegeStorageServiceImpl()
        let repo = CollegeRepositoryImpl(apiService: apiService, storageService: storageService)
        let interactor = CollegeListInteractor(repository: repo)
        let presenter = CollegeListPresenterImpl(router: router, interactor: interactor)
        
        let storyboard = UIStoryboard(name: "CollegeList", bundle: Bundle.module)
        var viewController = UIViewController()
        if #available(iOS 13.0, *) {
            viewController = storyboard.instantiateViewController(identifier: "CollegeListViewController") { coder in
                return CollegeListViewController(coder: coder, presenter: presenter)
            }
        } else {
        }
        
        router.viewController = viewController
        interactor.output = presenter
        return viewController
    }
}
