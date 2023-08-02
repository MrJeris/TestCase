//
//  ChildrenItem.swift
//  TestCase
//
//  Created by Ruslan Magomedov on 26.07.2023.
//

import SwiftUI

struct ChildrenItem: View {
    let name: String
    let age: String
    var onDelete: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            HStack(spacing: 28) {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Имя")
                        .foregroundColor(.gray)
                    Text(name)
                }
                .frame(maxWidth: 240, alignment: .leading)
                .modifier(RoundedBorders())
                
                Button("Удалить") {
                    onDelete()
                }
            }
            
            VStack(alignment: .leading, spacing: 6) {
                Text("Возраст")
                    .foregroundColor(.gray)
                Text(age)
            }
            .frame(maxWidth: 240, alignment: .leading)
            .modifier(RoundedBorders())
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ChildrenItem_Previews: PreviewProvider {
    static var previews: some View {
        ChildrenItem(name: "Пётр", age: "15", onDelete: {})
    }
}
