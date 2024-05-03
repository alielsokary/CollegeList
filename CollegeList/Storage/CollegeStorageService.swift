//
//  CollegeStorageService.swift
//  CollegeList
//
//  Created by Ali Elsokary on 03/05/2024.
//

import RealmSwift

class CollegeStorageService {
    private let realm: Realm

    init(realm: Realm = try! Realm()) {
        self.realm = realm
    }

    func save(college: CollegeViewModel) {
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

    func fetchColleges() -> [CollegeViewModel] {
        let collegeObjects = realm.objects(CollegeObject.self)
        return collegeObjects.map { CollegeViewModel(collegeObject: $0) }
    }
}
