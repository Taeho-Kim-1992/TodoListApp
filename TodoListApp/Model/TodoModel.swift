//
//  TodoModel.swift
//  TodoListApp
//
//  Created by 김태호 on 2022/05/05.
//

import Foundation

struct TodoModel: Identifiable, Codable {
    var id: String
    let isFinished: Bool
    let content: String

    init(id: String,
         isFinished: Bool = false,
         content: String) {
        self.id = id
        self.isFinished = isFinished
        self.content = content
    }

    init(isFinished: Bool = false,
         content: String) {
        self.id = UUID().uuidString
        self.isFinished = isFinished
        self.content = content
    }

    func getTodoFinished() -> TodoModel {
        return TodoModel(id: self.id,
                         isFinished: !self.isFinished,
                         content: self.content)
    }
}

