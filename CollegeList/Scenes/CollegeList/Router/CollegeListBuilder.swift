//
//  CollegeListBuilder.swift
//  CollegeList
//
//  Created by Ali Elsokary on 03/05/2024.
//

import UIKit

final class CollegeListBuilder {
    
    static func build() -> UIViewController {
        let router = CollegeListRouterImpl()
        let apiService = CollegeListServiceImpl()
        let storageService = CollegeStorageServiceImpl()
        let repo = CollegeRepositoryImpl(apiService: apiService, storageService: storageService)
        let interactor = CollegeListInteractor(repository: repo)
        let presenter = CollegeListPresenterImpl(router: router, interactor: interactor)
        
        let storyboard = UIStoryboard(name: "CollegeList", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "CollegeListViewController") { coder in
            return CollegeListViewController(coder: coder, presenter: presenter)
        }
        
        router.viewController = viewController
        interactor.output = presenter
        return viewController
    }
}
