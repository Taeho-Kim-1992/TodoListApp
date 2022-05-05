//
//  TodoCell.swift
//  TodoListApp
//
//  Created by 김태호 on 2022/05/05.
//

import SwiftUI

struct TodoCell: View {
    let todo: TodoModel
    var body: some View {
        HStack {
            Image(systemName: todo.isFinished ? "checkmark.circle" : "circle")
                .foregroundColor(todo.isFinished ? .blue : .red)
            Text(todo.content)
        }
    }
}


struct TodoCell_Previews: PreviewProvider {
    static var todoModel = TodoModel(content: "Todo Model")
    static var todoHomeWork = TodoModel(isFinished: true, content: "Todo homework")
    static var previews: some View {
        Group {
            TodoCell(todo: todoModel)
            TodoCell(todo: todoHomeWork)
        }
        .frame(width: 200, height: 40)
        .previewLayout(.sizeThatFits)
    }
}
