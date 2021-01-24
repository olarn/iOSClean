//
//  TodolistWorker.swift
//  iOSClean
//
//  Created by Olarn U. on 23/1/2564 BE.
//

import Foundation

class TodolistWorker {
    
    weak var interactor: TodolistInteractorDelegate?
    
    init() {
        Todolist.store.delegate = self
    }
    
    func add(todoItem: Todo) {
        Todolist.store.addTodoItems([todoItem])
    }
}

extension TodolistWorker: TodolistDelegate {

    func onItemUpdate(items: [Todo]) {
        interactor?.onTodolistUpdated(items)
    }
}
