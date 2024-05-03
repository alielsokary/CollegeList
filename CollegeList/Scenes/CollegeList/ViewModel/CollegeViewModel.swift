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
    let state: String
    let countryCode: String
    let webPage: String
    
    init(college: College) {
        self.name = college.name ?? ""
        self.country = college.country ?? ""
        self.state = college.stateProvince ?? ""
        self.countryCode = college.alphaTwoCode ?? ""
        self.webPage = college.webPages?.first ?? ""
    }
}
