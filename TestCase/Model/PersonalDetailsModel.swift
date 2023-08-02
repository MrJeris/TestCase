//
//  PersonalDataModel.swift
//  TestCase
//
//  Created by Ruslan Magomedov on 26.07.2023.
//

import Foundation

struct PersonalDetailsModel: Codable, Identifiable, Equatable {
    var id = UUID()
    var firstName: String = ""
    var lastName: String = ""
    var middleName: String = ""
    var age: String = ""
    var childrens = [ChildrenModel]()
}
