//
//  ContentView.swift
//  TodoListApp
//
//  Created by 김태호 on 2022/05/05.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var vm = MainViewModel()

    var body: some View {
        List {
            ForEach(vm.todos) { todo in
                TodoCell(todo: todo)
                    .onTapGesture { vm.update(todo: todo) }
            }
            .onDelete(perform: vm.deleteTodo)
            .onMove(perform: vm.moveTodo)
        }
        .navigationTitle("Todo List")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }

            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("Add", destination: {
                    AddTodoView()
                        .environmentObject(vm)
                })
            }
        }
    }
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MainView()
                .environmentObject(MainViewModel())
        }
    }
}
