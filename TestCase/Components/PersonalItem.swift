//
//  PersonalItem.swift
//  TestCase
//
//  Created by Ruslan Magomedov on 27.07.2023.
//

import SwiftUI

struct PersonalItem: View {
    @Binding var firstName: String
    @Binding var lastName: String
    @Binding var middleName: String
    @Binding var age: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Персональные данные")
                .font(.title2)
            
            VStack(alignment: .leading, spacing: 6) {
                Text("Имя")
                    .foregroundColor(.gray)
                TextField("Введите имя", text: $firstName)
                
            }
            .modifier(RoundedBorders())
            
            VStack(alignment: .leading, spacing: 6) {
                Text("Фамилия")
                    .foregroundColor(.gray)
                TextField("Введите фамилию", text: $lastName)
            }
            .modifier(RoundedBorders())
            
            VStack(alignment: .leading, spacing: 6) {
                Text("Отчество")
                    .foregroundColor(.gray)
                TextField("Введите отчество", text: $middleName)
            }
            .modifier(RoundedBorders())
            
            VStack(alignment: .leading, spacing: 6) {
                Text("Возраст")
                    .foregroundColor(.gray)
                TextField("Введите возраст", text: $age)
            }
            .modifier(RoundedBorders())
        }
        .padding(.bottom)
    }
}

struct PersonalItem_Previews: PreviewProvider {
    static var previews: some View {
        PersonalItem(firstName: .constant("Магомедов"),
                     lastName: .constant("Руслан"),
                     middleName: .constant("Шамилевич"),
                     age: .constant("23"))
    }
}
