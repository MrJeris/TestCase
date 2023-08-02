//
//  ChildrenModel.swift
//  TestCase
//
//  Created by Ruslan Magomedov on 26.07.2023.
//

import Foundation

struct ChildrenModel: Codable, Identifiable, Equatable {
    var id = UUID()
    var name: String
    var age: String
}
