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
        Todolist.todoItems =
        [
            Todo(title: "Read a book", dueDate: Date(), isDone: true),
            Todo(title: "Workout", dueDate: Date(), isDone: false),
            Todo(title: "Finish a game", dueDate: Date(), isDone: false),
        ]

        interactor?.onTodolistUpdated(Todolist.todoItems)
    }
}
