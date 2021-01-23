//
//  TodolistInteractor.swift
//  iOSClean
//
//  Created by Olarn U. on 23/1/2564 BE.
//

import Foundation

protocol TodolistInteractorDelegate: class {
    func onTodolistUpdated(_ todolist: Todolist)
}

class TodolistInteractor {
    var worker: TodolistWorker?
    var presenter: TodolistPresenterDelegate?

    func requestTodolist() {
        worker?.fetchTodolist()
    }
}

extension TodolistInteractor: TodolistInteractorDelegate {
    func onTodolistUpdated(_ todolist: Todolist) {
        presenter?.presentTodolist(todolist)
    }
}
