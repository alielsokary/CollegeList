//
//  CollegeDetailsInteractor.swift
//  CollegeList
//
//  Created by Ali Elsokary on 03/05/2024.
//

import Foundation
import CollegeListCore

protocol CollegeDetailsInteractorLogic {
    var viewModel: CollegeViewModel { get set }
}

class CollegeDetailsInteractor: CollegeDetailsInteractorLogic {
        
    var viewModel: CollegeViewModel
    
    init(viewModel: CollegeViewModel) {
        self.viewModel = viewModel
    }
}


extension Notification.Name {
    static let collegeDataRefreshed = Notification.Name("collegeDataRefreshed")
}
