//
//  PersonalDetailsView.swift
//  TestCase
//
//  Created by Ruslan Magomedov on 26.07.2023.
//

import SwiftUI

struct PersonalDetailsView: View {
    @StateObject private var vm = PersonalDetailsViewModel()
    @State private var showAddChildren = false
    @State private var showActionSheet = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            PersonalItem(firstName: $vm.personDetails.firstName,
                         lastName: $vm.personDetails.lastName,
                         middleName: $vm.personDetails.middleName,
                         age: $vm.personDetails.age)
            
            children
            
            if !vm.personDetails.childrens.isEmpty {
                deleteButton
            }
        }
        .padding()
        .ignoresSafeArea(edges: .bottom)
        
        //MARK: - New children sheet
        .sheet(isPresented: $showAddChildren) {
            NewChildrenView(childrens: $vm.personDetails.childrens)
        }
        
        //MARK: - ActionSheet
        .confirmationDialog("Вы действительно хотите сбросить данные?", isPresented: $showActionSheet) {
            Button("Сбросить данные", role: .destructive) {
                vm.personDetails = PersonalDetailsModel()
            }
            .animation(.easeIn, value: vm.personDetails)
            
            Button("Отмена", role: .cancel, action: {})
        }
        .animation(.easeIn, value: vm.personDetails)
    }
}

struct PersonalDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalDetailsView()
    }
}

private extension PersonalDetailsView {
    //MARK: - Children block
    var children: some View {
        VStack(alignment: .leading) {
            //MARK: - Toolbar children block
            HStack {
                Text("Дети (макс. \(PersonalDetailsViewModel.maximumChildren))")
                    .font(.title2)
                
                Spacer()
                
                if vm.personDetails.childrens.count < PersonalDetailsViewModel.maximumChildren {
                    addChildrenButton
                }
            }
            .animation(.easeIn, value: vm.personDetails.childrens)
            
            //MARK: - List childrens
            ForEach(vm.personDetails.childrens) { children in
                HStack(alignment: .top) {
                    ChildrenItem(name: children.name, age: children.age) {
                        vm.removeChildren(children: children)
                    }
                    .animation(.easeIn, value: vm.personDetails.childrens)
                }
                .padding(.vertical)
                
                //MARK: - Don't add to last item Divider
                if children != vm.personDetails.childrens.last {
                    Divider()
                }
            }
        }
    }
}


private extension PersonalDetailsView {
    
    //MARK: - Add children button
    var addChildrenButton: some View {
        Button {
            showAddChildren.toggle()
        } label: {
            HStack {
                Image(systemName: "plus")
                    .bold()
                
                Text("Добавить ребёнка")
            }
            .modifier(CapsuleBorders(color: .blue))
        }
    }
    
    //MARK: - Delete button
    var deleteButton: some View {
        Button("Очистить") {
            showActionSheet.toggle()
        }
        .padding(.horizontal, 80)
        .modifier(CapsuleBorders(color: .red))
    }
}
