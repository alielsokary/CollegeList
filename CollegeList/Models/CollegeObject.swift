//
//  CollegeObject.swift
//  CollegeList
//
//  Created by Ali Elsokary on 03/05/2024.
//

import RealmSwift

class CollegeObject: Object {
    @Persisted var name: String = ""
    @Persisted var country: String = ""
    @Persisted var state: String = ""
    @Persisted var countryCode: String = ""
    @Persisted var webPage: String = ""
}
