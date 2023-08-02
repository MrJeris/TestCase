//
//  NewChildrenView.swift
//  TestCase
//
//  Created by Ruslan Magomedov on 26.07.2023.
//

import SwiftUI

struct NewChildrenView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var childrens: [ChildrenModel]
    @State private var name = ""
    @State private var age = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Spacer()
            
            Text("Добавление ребёнка")
                .font(.title)
            
            VStack(alignment: .leading, spacing: 6) {
                Text("Имя")
                    .foregroundColor(.gray)
                TextField("Введите имя", text: $name)
                if name.isEmpty {
                    Text("Имя не может быть пустым")
                        .foregroundColor(.red)
                        .font(.caption)
                }
            }
            .modifier(RoundedBorders())
            .animation(.default, value: name)
            
            VStack(alignment: .leading, spacing: 6) {
                Text("Возраст")
                    .foregroundColor(.gray)
                TextField("Введите возраст", text: $age)
                if age.isEmpty {
                    Text("Возраст не может быть пустым")
                        .foregroundColor(.red)
                        .font(.caption)
                }
            }
            .modifier(RoundedBorders())
            .animation(.default, value: age)
            
            Spacer()
            
            Button("Добавить") {
                childrens.append(ChildrenModel(name: name, age: age))
                dismiss()
            }
            .padding(.horizontal, 80)
            .modifier(CapsuleBorders(color: (!name.isEmpty && !age.isEmpty) ? .blue : .gray))
            .frame(maxWidth: .infinity)
            .disabled(name.isEmpty && age.isEmpty)
            
            Spacer()
        }
        .padding()
    }
}

struct NewChildrenView_Previews: PreviewProvider {
    static var previews: some View {
        NewChildrenView(childrens: .constant([ChildrenModel]()))
    }
}
