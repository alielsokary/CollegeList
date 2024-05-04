//
//  CollegeViewModel.swift
//  CollegeList
//
//  Created by Ali Elsokary on 03/05/2024.
//

import Foundation

public class CollegeViewModel {
    public let name: String
    public let country: String
    public let state: String
    public let countryCode: String
    public let webPage: String
    
    public init(college: College) {
        self.name = college.name ?? ""
        self.country = college.country ?? ""
        self.state = college.stateProvince ?? ""
        self.countryCode = college.alphaTwoCode ?? ""
        self.webPage = college.webPages?.first ?? ""
    }
    
    public init(collegeObject: CollegeObject) {
        self.name = collegeObject.name
        self.country = collegeObject.country
        self.state = collegeObject.state
        self.countryCode = collegeObject.countryCode
        self.webPage = collegeObject.webPage
    }
}
