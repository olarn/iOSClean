//
//  TodolistWorker.swift
//  iOSClean
//
//  Created by Olarn U. on 23/1/2564 BE.
//

import Foundation

class TodolistWorker {
    
    weak var interactor: TodolistInteractorDelegate?
    
    func fetchTodolist() {
        var todoList = Todolist()
        [
            Todo(title: "Read a book", dueDate: Date(), isDone: true),
            Todo(title: "Workout", dueDate: Date(), isDone: false),
            Todo(title: "Finish a game", dueDate: Date(), isDone: false),
        ].forEach { item in
            todoList.todoItems.append(item)
        }

        interactor?.onTodolistUpdated(todoList)
    }
}
