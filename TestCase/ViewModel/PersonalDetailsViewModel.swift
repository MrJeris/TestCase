//
//  PersonalDetailsViewModel.swift
//  TestCase
//
//  Created by Ruslan Magomedov on 26.07.2023.
//

import Foundation

final class PersonalDetailsViewModel: ObservableObject {
    //MARK: - Saving all entered data
    @Published var personDetails = PersonalDetailsModel() {
        didSet {
            if let encoder = try? JSONEncoder().encode(personDetails) {
                UserDefaults.standard.set(encoder, forKey: "personDetails")
            }
        }
    }
    
    //MARK: - Getting all the entered data
    init() {
        
        if let savedPersonDetails = UserDefaults.standard.data(forKey: "personDetails") {
            if let decodedPersonDetails = try? JSONDecoder().decode(PersonalDetailsModel.self, from: savedPersonDetails) {
                personDetails = decodedPersonDetails
                return
            }
        }
        
        personDetails = PersonalDetailsModel(firstName: "", lastName: "", middleName: "", childrens: [])
    }
    
    //MARK: - Delete children func
    func removeChildren(children: ChildrenModel) {
        guard let index = personDetails.childrens.firstIndex(of: children) else { return }
        personDetails.childrens.remove(at: index)
    }
    
    //MARK: - Limit children count
    static let maximumChildren = 5
}
