//
//  HomePresenter.swift
//  iOSClean
//
//  Created by Olarn U. on 23/1/2564 BE.
//

import Foundation

protocol TodolistPresenterDelegate {
    func presentTodolist(_ todoItems: [Todo])
}

class TodolistPresenter: TodolistPresenterDelegate {
    
    weak var viewController: TodolistViewControllerDelegate?
    
    func presentTodolist(_ todoItems: [Todo]) {
        viewController?.refresh(todoItems)
    }
}
