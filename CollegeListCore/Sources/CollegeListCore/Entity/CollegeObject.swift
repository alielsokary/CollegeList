//
//  CollegeObject.swift
//  CollegeList
//
//  Created by Ali Elsokary on 03/05/2024.
//

import RealmSwift

public class CollegeObject: Object {
    @Persisted public var name: String = ""
    @Persisted public var country: String = ""
    @Persisted public var state: String = ""
    @Persisted public var countryCode: String = ""
    @Persisted public var webPage: String = ""
}
