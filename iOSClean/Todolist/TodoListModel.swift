//
//  TodoListModel.swift
//  iOSClean
//
//  Created by Olarn U. on 23/1/2564 BE.
//

import Foundation

protocol TodolistDelegate: class {
    func onItemUpdate(items: [Todo])
}

class Todolist {
    
    private init() {}
    private static var _sharedInstance = Todolist()

    static var store: Todolist {
        return _sharedInstance
    }
    
    weak var delegate: TodolistDelegate?

    private var _todoItems: [Todo] = []

    var todoItems: [Todo] {
        return _todoItems
    }

    func addTodoItems(_ items: [Todo]) {
        items.forEach { eachItem in
            _todoItems.append(eachItem)
        }
        delegate?.onItemUpdate(items: _todoItems)
    }
    
    func updateItem(_ index: Int, with todo: Todo) {
        _todoItems.replaceSubrange(index...index, with: [todo])
        delegate?.onItemUpdate(items: _todoItems)
    }
}

struct Todo: Equatable {
    var title: String
    var dueDate: Date
    var isDone: Bool
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return
            lhs.title == rhs.title &&
            lhs.dueDate == rhs.dueDate &&
            lhs.isDone == rhs.isDone
    }
}

extension Date {
    func toString(format: String = "dd-MM-yyyy") -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
