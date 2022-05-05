//
//  MainViewModel.swift
//  TodoListApp
//
//  Created by 김태호 on 2022/05/05.
//

import Foundation
import SwiftUI

class MainViewModel: ObservableObject {
    @Published var todos: [TodoModel] = [] {
        willSet { self.autoSaveTodoList() }
    }

    init() {
        loadTodoList()
    }

    func update(todo: TodoModel) {
        guard let index = todos.firstIndex(where: { $0.id == todo.id }) else {
            return
        }
        todos[index] = todo.getTodoFinished()
    }

    func addTodo(todoContent: String) {
        todos.append(TodoModel(content: todoContent))
    }

    func deleteTodo(indexSet: IndexSet) {
        todos.remove(atOffsets: indexSet)
    }

    func moveTodo(from: IndexSet, to: Int) {
        todos.move(fromOffsets: from, toOffset: to)
    }

    private func autoSaveTodoList() {
        guard let todoJson = try? JSONEncoder().encode(todos) else {
            return
        }
        UserDefaults.standard.set(todoJson, forKey: "myTodo")
    }

    private func loadTodoList() {
        guard let todoData = UserDefaults.standard.data(forKey: "myTodo"),
              let todo = try? JSONDecoder().decode([TodoModel].self, from: todoData) else {
            return
        }
        self.todos = todo
    }
}
