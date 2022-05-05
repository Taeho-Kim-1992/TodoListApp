//
//  AddTodoView.swift
//  TodoListApp
//
//  Created by 김태호 on 2022/05/05.
//

import SwiftUI

struct AddTodoView: View {
    @State private var todoContent = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var vm: MainViewModel

    var body: some View {
        VStack {
            TextField("What do you have to do ??", text: $todoContent)
                .font(.title)
                .textFieldStyle(.roundedBorder)
                .padding()
            Button(
                action: onClickAddButton,
                label: getButtonLabel)
        }
    }

    private func onClickAddButton() {
        vm.addTodo(todoContent: todoContent)
        dismiss()
    }

    private func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }

    private func getButtonLabel() -> some View {
                RoundedRectangle(cornerRadius: 30)
                    .frame(height: 80)
                    .padding(.horizontal)
                    .overlay(
                        Text("Add")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    )
    }
}


struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddTodoView()
        }
    }
}
