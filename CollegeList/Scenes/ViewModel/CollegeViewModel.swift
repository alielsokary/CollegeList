//
//  CollegeViewModel.swift
//  CollegeList
//
//  Created by Ali Elsokary on 03/05/2024.
//

import Foundation

class CollegeViewModel {
    let name: String
    let country: String
    
    init(college: College) {
        self.name = college.name ?? ""
        self.country = college.country ?? ""
    }
}
