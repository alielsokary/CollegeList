//
//  CollegeDetailsInteractor.swift
//  CollegeList
//
//  Created by Ali Elsokary on 03/05/2024.
//

import Foundation
import CollegeListCore

public protocol CollegeDetailsInteractorLogic {
    var viewModel: CollegeViewModel { get set }
}

public class CollegeDetailsInteractor: CollegeDetailsInteractorLogic {
        
    public var viewModel: CollegeViewModel
    
    public init(viewModel: CollegeViewModel) {
        self.viewModel = viewModel
    }
}

