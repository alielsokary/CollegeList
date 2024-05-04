//
//  CollegeStorageService.swift
//  CollegeList
//
//  Created by Ali Elsokary on 03/05/2024.
//

import RealmSwift

public protocol CollegeStorageService {
    func save(college: CollegeViewModel)
    func fetchColleges() -> [CollegeViewModel]
}

public class CollegeStorageServiceImpl: CollegeStorageService {
    private let realm: Realm

    public init(realm: Realm = try! Realm()) {
        self.realm = realm
    }

    public func save(college: CollegeViewModel) {
        let collegeObject = CollegeObject()
        collegeObject.name = college.name
        collegeObject.country = college.country
        collegeObject.state = college.state
        collegeObject.countryCode = college.countryCode
        collegeObject.webPage = college.webPage

        try! realm.write {
            realm.add(collegeObject)
        }
    }

    public func fetchColleges() -> [CollegeViewModel] {
        let collegeObjects = realm.objects(CollegeObject.self)
        return collegeObjects.map { CollegeViewModel(collegeObject: $0) }
    }
}
